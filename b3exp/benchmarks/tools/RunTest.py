# -*- coding: utf-8 -*-

# QuestaSimを用いて雷上動プロセッサをテストする。
# プロセッサ上でテストプログラムを実行し、実行結果の検証を行う。

import os, sys, subprocess
from optparse import OptionParser
from xml.etree import ElementTree

QUESTASIM_DIR_PATH = os.environ['RSD_QUESTASIM_PATH']
VSIM_PATH = QUESTASIM_DIR_PATH + '/vsim -c +SEED=0'
CFG_XML_FILE_NAME = 'cfg.xml'
REG_OUT_FILE_NAME = 'reg.out.hex'
SERIAL_OUT_FILE_NAME = 'serial.out.txt'
SERIAL_REF_FILE_NAME = 'serial.ref.txt'

# Warning! : vsim cannot use abspath as commandline argument
QUESTASIM_PROJECT_DIR_PATH = os.path.relpath(
    os.path.join( os.path.dirname( __file__ ), '../../Project/ModelSim' )
)

class ConfigParser( object ):
    """ Parse a test configuration XML file. """

    # Const
    REG_NUMS = {
        'R0' :0,   'r0' :0,
        'R1' :1,   'r1' :1,
        'R2' :2,   'r2' :2,
        'R3' :3,   'r3' :3,
        'R4' :4,   'r4' :4,
        'R5' :5,   'r5' :5,
        'R6' :6,   'r6' :6,
        'R7' :7,   'r7' :7,
        'R8' :8,   'r8' :8,
        'R9' :9,   'r9' :9,
        'R10':10,  'r10':10,
        'R11':11,  'r11':11,
        'R12':12,  'r12':12,
        'R13':13,  'r13':13,
        'R14':14,  'r14':14,
        'R15':15,  'r15':15,
        'R16':16,  'r16':16,
        'R17':17,  'r17':17,
        'R18':18,  'r18':18,
        'R19':19,  'r19':19,
        'R20':20,  'r20':20,
        'R21':21,  'r21':21,
        'R22':22,  'r22':22,
        'R23':23,  'r23':23,
        'R24':24,  'r24':24,
        'R25':25,  'r25':25,
        'R26':26,  'r26':26,
        'R27':27,  'r27':27,
        'R28':28,  'r28':28,
        'R29':29,  'r29':29,
        'R30':30,  'r30':30,
        'R31':31,  'r31':31,
        'PC':32
        }

    def __init__( self ):
        self.maxTestCycles = None
        self.registerValueDict = {}

    def Parse( self, xmlFileName ):
        # Parse XML File
        self.xmlFileName = xmlFileName
        tree = ElementTree.parse( xmlFileName )

        # Set max test cycle
        self.maxTestCycles = int( tree.findtext('./MaxTestCycles') )
        if ( self.maxTestCycles is None ):
            raise TestConfigError( 'Element "./MaxTestCycles" is not found in %s' % xmlFileName )

        # Set reference register values.
        elemRegisterValues = tree.find('./RegisterValues')
        if ( elemRegisterValues is None ):
            raise TestConfigError( 'Element "./RegisterValues" is not found in %s' % xmlFileName )

        for elem in elemRegisterValues:
            regNum = self.REG_NUMS[ elem.tag ]
            regValue = int( elem.text.lstrip().rstrip(), 0 )
            self.registerValueDict[regNum] = regValue


class SimulationDriver( object ):
    LIBRARY_NAME = 'Main'
    TOP_MODULE_NAME = 'TestMain'
    VSIM_LOG_FILE_NAME = 'vsim.log'

    def __init__( self, projectDirPath, testCodeDirPath ):
        self.projectDirPath = projectDirPath   # QuestaSimのプロジェクトディレクトリ
        self.testCodeDirPath = testCodeDirPath # テストコードの存在するディレクトリ
        self.vsimLogPath = os.path.join( testCodeDirPath, self.VSIM_LOG_FILE_NAME )
        self.additionalOptionList = []

    # シミュレーション実行時にvsimに与えるオプションを追加
    def AddOption( self, option ):
        self.additionalOptionList.append( option )

    # シミュレーションを実行
    def RunSimulation( self, omitStdout ):
        # Module "subprocess doesn't work correctly.
        #    - command : "subprocess.call( cmd, cwd=projectDir )"
        # Use os.system.
        cmd = """
            %s %s/%s.%s \
            +TEST_CODE=%s \
            %s -do "run -all" %s
            """ % ( VSIM_PATH,
            self.projectDirPath,
            self.LIBRARY_NAME,
            self.TOP_MODULE_NAME,
            self.testCodeDirPath,
            " ".join( self.additionalOptionList ),
            "> " + self.vsimLogPath if omitStdout else "| tee " + self.vsimLogPath
        )
        print(cmd)
        os.system( cmd )

class RegisterValueComparator( object ):
    def __init__( self, testCodeName ):
        self.testCodeName = testCodeName

    def Compare( self, refRegValueDict, outFileName ):
        # ReadOutFile
        outFile = open( outFileName, 'r' )
        self.outRegTextList = []
        for line in outFile:
            self.outRegTextList.append( line.lstrip().rstrip() )
        outFile.close()

        # PrintDiff
        self.numComparedReg = 0
        self.diffInfoList = []
        for ( regNum, refValue ) in refRegValueDict.items():
            self.numComparedReg += 1
            refText = str( refValue )
            outText = self.outRegTextList[ regNum ]

            try:
                outValue = int( outText, 0 )

                # outValueは32bitの16進数なので符号なしで扱うが、
                # refValueは符号ありで与えられることがある。
                # 両者を適切に比較するために補正する
                if ( outValue > 2**31 and refValue < 2**31 ):
                    outValue = - ( 2**32 - outValue )

                # outValueを補正したら、それに合わせてoutTextを修正
                outText = str( outValue )

                # refとoutが不一致ならdiffInfoListに追加
                if ( refValue != outValue ):
                    self.diffInfoList.append( (regNum, refText, outText ) )
            except ValueError:
                self.diffInfoList.append( (regNum, refText, outText ) )

        self.isMatched = ( len( self.diffInfoList ) == 0 )


    # 比較結果を表示。Compareを呼んだ後に呼ぶ必要がある
    def PrintCompareResult( self ):
        if ( self.isMatched ):
            print 'OK ( %s ) : %d registers have correct values.' % ( self.testCodeName, self.numComparedReg )
        else:
            print 'NG ( %s ) : some registers have incorrect values.' % self.testCodeName
            for diffInfo in self.diffInfoList:
                print 'R%d\t %s (ref)\t-> %s (out)' % ( diffInfo[0], diffInfo[1], diffInfo[2] )

    # refとoutが一致しているかどうかを返す。Compareを呼んだ後に呼ぶ必要がある
    def IsMatched( self ):
        return self.isMatched

# シリアル出力を検証するため、
# あらかじめ用意したrefファイルと比較する。
class SerialOutputComparator( object ):
    def __init__( self, testCodeName ):
        self.testCodeName = testCodeName

    def Compare( self, refFileName, outFileName ):
        # 比較するファイル読み込む。改行コードはLFに統一。
        self.outStr = open( outFileName, "r" ).read().replace( '\r' , '' )
        self.refStr = open( refFileName, "r" ).read().replace( '\r' , '' )

        # 比較
        self.isMatched = ( self.outStr == self.refStr )

    # 比較結果を表示。Compareを呼んだ後に呼ぶ必要がある
    def PrintCompareResult( self ):
        if self.isMatched:
            print "OK ( %s ) : The serial output text is correct." % ( self.testCodeName )
        else:
            print "NG ( %s ) : The serial output text is incorrect."
            print "--------\nREF\n--------"
            print self.refStr
            print "--------\nOUT\n--------"
            print self.outStr

    # refとoutが一致しているかどうかを返す。Compareを呼んだ後に呼ぶ必要がある
    def IsMatched( self ):
        return self.isMatched


# テストに失敗して結果が出なかった時に、
# CompareRegValue()で前回のテスト結果が使われるのを防ぐため、
# 前回のテスト結果のファイルを削除する。
def RemoveTestResult( regOutPath, serialOutPath ):
    # OSErrorを無視するためにtry-exceptを使用
    try:
        os.remove( regOutPath )
    except:
        pass
    try:
        os.remove( serialOutPath )
    except:
        pass

#---------------------------
# The entry point of this program
#
# parse option
parser = OptionParser()
parser.add_option('-o', '--omit-questasim-message',
                  action='store_true', dest='omitQuestasimMessage', default=False,
                  help="Omit output messages of QuestaSim.")
parser.add_option('-l', '--rsd-log',
                  action='store', type='string', dest='rsdLogFileName',
                  help="Specify an RSD log file name.")
options, testCodePathList = parser.parse_args()

if not testCodePathList:
    print ("Error : no TestCode specified.")
    sys.exit(3)

# Main loop
for testCodePath in testCodePathList:
    # 各ファイルのパスを設定
    regOutPath = os.path.join( testCodePath, REG_OUT_FILE_NAME )
    serialOutPath = os.path.join( testCodePath, SERIAL_OUT_FILE_NAME )
    serialRefPath = os.path.join( testCodePath, SERIAL_REF_FILE_NAME )

    # 過去のテスト結果を消去
    RemoveTestResult( regOutPath, serialOutPath )

    # cfg.xml読み込み
    cfgXmlPath = os.path.join( testCodePath, CFG_XML_FILE_NAME )
    config = ConfigParser()
    config.Parse( cfgXmlPath )

    # シミュレーション実行
    simDriver = SimulationDriver( QUESTASIM_PROJECT_DIR_PATH, testCodePath )
    simDriver.AddOption( "+MAX_TEST_CYCLES=%d" % ( config.maxTestCycles ) )
    if options.rsdLogFileName is not None:
        simDriver.AddOption( "+RSD_LOG_FILE=%s" % ( options.rsdLogFileName ) )
    simDriver.RunSimulation( options.omitQuestasimMessage )

    # シミュレーション時のレジスタの値を、リファレンスと比較
    regValueComparator = RegisterValueComparator( testCodePath )
    regValueComparator.Compare( config.registerValueDict, regOutPath )
    regValueComparator.PrintCompareResult()

    # シミュレーション時のシリアル出力を、リファレンスと比較
    if os.path.exists( serialRefPath ):
        # シリアル出力比較は、refファイルがある場合のみやる
        serialOutComparator = SerialOutputComparator( testCodePath )
        serialOutComparator.Compare( serialRefPath, serialOutPath )
        serialOutComparator.PrintCompareResult()

    # テスト結果が違っていたら、エラーを返す
    if os.path.exists( serialRefPath ):
        if not regValueComparator.IsMatched():
            sys.exit(2)
        if not serialOutComparator.IsMatched():
            sys.exit(1)
    else:
        if not regValueComparator.IsMatched():
            sys.exit(2)