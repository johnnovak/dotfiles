if exists('b:current_syntax')
  finish
endif

if !exists('g:nim_highlight_numbers')
  let s:nim_highlight_numbers = 1
endif

if !exists('g:nim_highlight_builtins')
  let s:nim_highlight_builtins = 1
endif

if !exists('g:nim_highlight_exceptions')
  let s:nim_highlight_exceptions = 1
endif

if !exists('g:nim_highlight_space_errors')
  let s:nim_highlight_space_errors = 1
endif

if !exists('g:nim_highlight_special_vars')
  let s:nim_highlight_special_vars = 1
endif

if exists('g:nim_highlight_all')
  let s:nim_highlight_numbers      = 1
  let s:nim_highlight_builtins     = 1
  let s:nim_highlight_exceptions   = 1
  let s:nim_highlight_space_errors = 1
  let s:nim_highlight_special_vars = 1
endif

syn region nimBrackets       contained extend keepend matchgroup=Bold start=+\(\\\)\@<!\[+ end=+]\|$+ skip=+\\\s*$\|\(\\\)\@<!\\]+ contains=@tclCommandCluster

syn keyword nimKeyword       addr and as asm atomic
syn keyword nimKeyword       bind block break
syn keyword nimKeyword       case cast concept const continue converter
syn keyword nimKeyword       defer discard distinct div do
syn keyword nimKeyword       elif else end enum except export
syn keyword nimKeyword       finally for from
syn keyword nimKeyword       if import in include interface is isnot iterator
syn keyword nimKeyword       let
syn keyword nimKeyword       mixin mod
syn keyword nimKeyword       nil not notin
syn keyword nimKeyword       object of or out
syn keyword nimKeyword       proc func method macro template nextgroup=nimFunction skipwhite
syn keyword nimKeyword       ptr
syn keyword nimKeyword       raise ref return
syn keyword nimKeyword       shl shr static
syn keyword nimKeyword       try tuple type
syn keyword nimKeyword       using
syn keyword nimKeyword       var
syn keyword nimKeyword       when while
syn keyword nimKeyword       xor
syn keyword nimKeyword       yield

syn match   nimFunction      "[a-zA-Z_][a-zA-Z0-9_]*" contained
syn match   nimClass         "[a-zA-Z_][a-zA-Z0-9_]*" contained
syn keyword nimRepeat        for while
syn keyword nimConditional   if elif else case of
syn keyword nimOperator      and in is not or xor shl shr div
syn match   nimComment       "#.*$" contains=nimTodo,@Spell
syn region  nimComment       start="#\[" end="\]#" contains=nimTodo,@Spell
syn keyword nimTodo          TODO FIXME XXX contained
syn keyword nimBoolean       true false

" Strings
syn region nimString start=+'+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend contains=nimEscape,nimEscapeError,@Spell
syn region nimString start=+"+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend contains=nimEscape,nimEscapeError,@Spell
syn region nimString start=+"""+ end=+"""+ keepend contains=nimEscape,nimEscapeError,@Spell
syn region nimRawString matchgroup=Normal start=+[rR]"+ end=+"+ skip=+\\\\\|\\"+ contains=@Spell

syn match  nimEscape    +\\[abfnrtv'"\\]+ contained
syn match  nimEscape    "\\\o\{1,3}" contained
syn match  nimEscape    "\\x\x\{2}" contained
syn match  nimEscape    "\(\\u\x\{4}\|\\U\x\{8}\)" contained
syn match  nimEscape    "\\$"

syn match nimEscapeError "\\x\x\=\X" display contained

if s:nim_highlight_numbers == 1
  " numbers (including longs and complex)
  let s:dec_num = '\d%(_?\d)*'
  let s:int_suf = '%(''%(%(i|I|u|U)%(8|16|32|64)|u|U))'
  let s:float_suf = '%(''%(%(f|F)%(32|64|128)?|d|D))'
  let s:exp = '%([eE][+-]?'.s:dec_num.')'

  exe 'syn match nimNumber /\v<0[bB][01]%(_?[01])*%('.s:int_suf.'|'.s:float_suf.')?>/'
  exe 'syn match nimNumber /\v<0[ocC]\o%(_?\o)*%('.s:int_suf.'|'.s:float_suf.')?>/'
  exe 'syn match nimNumber /\v<0[xX]\x%(_?\x)*%('.s:int_suf.'|'.s:float_suf.')?>/'
  exe 'syn match nimNumber /\v<'.s:dec_num.'%('.s:int_suf.'|'.s:exp.'?'.s:float_suf.'?)>/'
  exe 'syn match nimNumber /\v<'.s:dec_num.'\.'.s:dec_num.s:exp.'?'.s:float_suf.'?>/'

  unlet s:dec_num s:int_suf s:float_suf s:exp
endif


if s:nim_highlight_builtins == 1
  " types
  syn keyword nimBuiltin float float32 float64 char string cstring pointer
  syn keyword nimBuiltin typedesc ptr ref void auto any untyped typed int
  syn keyword nimBuiltin int8 int16 int32 int64 uint uint8 uint16 uint32
  syn keyword nimBuiltin uint64 bool SomeSignedInt SomeUnsignedInt
  syn keyword nimBuiltin SomeInteger SomeOrdinal BiggestInt SomeFloat
  syn keyword nimBuiltin SomeNumber Ordinal static type TypeOfMode range
  syn keyword nimBuiltin array openArray varargs seq set UncheckedArray sink
  syn keyword nimBuiltin lent HSlice Slice byte Natural Positive RootObj
  syn keyword nimBuiltin RootRef RootEffect TimeEffect IOEffect ReadIOEffect
  syn keyword nimBuiltin WriteIOEffect ExecIOEffect StackTraceEntry JsRoot
  syn keyword nimBuiltin owned Endianness TaintedString ByteAddress
  syn keyword nimBuiltin BiggestFloat BiggestUInt clong culong cchar cschar
  syn keyword nimBuiltin cshort cint csize csize_t clonglong cfloat cdouble
  syn keyword nimBuiltin clongdouble cuchar cushort cuint culonglong
  syn keyword nimBuiltin cstringArray PFloat32 PFloat64 PInt64 PInt32
  syn keyword nimBuiltin AllocStats AtomType GC_Strategy PFrame TFrame
  syn keyword nimBuiltin FileSeekPos ForeignCell BackwardsIndex NimNode
  syn keyword nimBuiltin ForLoopStmtA

  " vars
  syn keyword nimBuiltin programResult globalRaiseHook localRaiseHook
  syn keyword nimBuiltin outOfMemHook unhandledExceptionHook
  syn keyword nimBuiltin errorMessageWriter onUnhandledException

  " lets
  syn keyword nimBuiltin nimvm

  " consts
  syn keyword nimBuiltin on off appType NoFakeVars isMainModule CompileDate
  syn keyword nimBuiltin CompileTime cpuEndian hostOS hostCPU
  syn keyword nimBuiltin nimEnableCovariance QuitSuccess QuitFailure Inf
  syn keyword nimBuiltin NegInf NaN nimCoroutines NimMajor NimMinor NimPatch
  syn keyword nimBuiltin NimVersion nativeStackTraceSupported

  " funcs & procs
  syn keyword nimBuiltin GC_collectZct GC_disable GC_disableMarkAndSweep
  syn keyword nimBuiltin GC_enable GC_enableMarkAndSweep GC_fullCollect
  syn keyword nimBuiltin GC_getStatistics GC_ref GC_unref abs add addAndFetch
  syn keyword nimBuiltin addEscapedChar addFloat addInt addQuitProc addQuoted
  syn keyword nimBuiltin alignof alloc0Impl allocCStringArray allocImpl
  syn keyword nimBuiltin allocShared0Impl allocSharedImpl ashr astToStr
  syn keyword nimBuiltin atomicDec atomicInc card cas chr clamp cmp
  syn keyword nimBuiltin compileOption compiles copyMem cpuRelax
  syn match   nimBuiltin "\<contains\>"
  syn keyword nimBuiltin create createShared createSharedU createU
  syn keyword nimBuiltin cstringArrayToSeq dealloc deallocCStringArray
  syn keyword nimBuiltin deallocHeap deallocImpl deallocShared
  syn keyword nimBuiltin deallocSharedImpl debugEcho dec declared
  syn keyword nimBuiltin declaredInScope deepCopy default defined del delete
  syn keyword nimBuiltin destroy dispose echo equalMem excl find finished
  syn keyword nimBuiltin freeShared gcInvariant getAllocStats
  syn keyword nimBuiltin getCurrentException getCurrentExceptionMsg getFrame
  syn keyword nimBuiltin getFrameState getFreeMem getGcFrame getMaxMem
  syn keyword nimBuiltin getOccupiedMem getStackTrace getStackTraceEntries
  syn keyword nimBuiltin getTotalMem getTypeInfo gorge gorgeEx high inc incl
  syn keyword nimBuiltin insert instantiationInfo internalNew isNil
  syn keyword nimBuiltin isNotForeign iterToProc len locals low max min move
  syn keyword nimBuiltin moveMem new newSeq newSeqOfCap newSeqUninitialized
  syn keyword nimBuiltin newString newStringOfCap nimGC_setStackBottom ord
  syn keyword nimBuiltin pop popGcFrame pred procCall protect pushGcFrame
  syn keyword nimBuiltin quit rawEnv rawProc realloc0Impl reallocImpl
  syn keyword nimBuiltin reallocShared0Impl reallocSharedImpl repr reset
  syn keyword nimBuiltin resize resizeShared runnableExamples setControlCHook
  syn keyword nimBuiltin setCurrentException setFrame setFrameState setGcFrame
  syn keyword nimBuiltin setLen setupForeignThreadGc shallow shallowCopy
  syn keyword nimBuiltin sizeof slurp stackTraceAvailable staticExec
  syn keyword nimBuiltin staticRead substr succ swap tearDownForeignThreadGc
  syn keyword nimBuiltin toBiggestFloat toBiggestInt toFloat toInt toOpenArray
  syn keyword nimBuiltin toOpenArrayByte toU16 toU32 toU8 typeof unsafeAddr
  syn keyword nimBuiltin unsafeNew unsetControlCHook wasMoved writeStackTrace
  syn keyword nimBuiltin ze ze64 zeroMem
endif

if s:nim_highlight_exceptions == 1
  syn keyword nimException Exception

  " built-in errors
  syn keyword nimError CatchableError
  syn keyword nimError IOError EOFError OSError LibraryError
  syn keyword nimError ResourceExhaustedError ValueError
  syn keyword nimError KeyError ArithmeticError DivByZeroError
  syn keyword nimError OverflowError AccessViolationError AssertionError
  syn keyword nimError OutOfMemError IndexError FieldError RangeError
  syn keyword nimError StackOverflowError ReraiseError
  syn keyword nimError ObjectAssignmentError ObjectConversionError
  syn keyword nimError FloatingPointError FloatInvalidOpError
  syn keyword nimError FloatDivByZeroError FloatOverflowError
  syn keyword nimError FloatUnderflowError FloatInexactError
  syn keyword nimError DeadThreadError NilAccessError

  " built-in defects
  syn keyword nimDefect Defect
  syn keyword nimDefect ArithmeticDefect DivByZeroDefect OverflowDefect
  syn keyword nimDefect AccessViolationDefect AssertionDefect
  syn keyword nimDefect OutOfMemDefect IndexDefect FieldDefect RangeDefect
  syn keyword nimDefect StackOverflowDefect ReraiseDefect
  syn keyword nimDefect ObjectAssignmentDefect ObjectConversionDefect
  syn keyword nimDefect FloatingPointDefect FloatInvalidOpDefect
  syn keyword nimDefect FloatDivByZeroDefect FloatOverflowDefect
  syn keyword nimDefect FloatUnderflowDefect FloatInexactDefect
  syn keyword nimDefect DeadThreadDefect NilAccessDefect
endif

if s:nim_highlight_space_errors == 1
  " trailing whitespace
  syn match   nimSpaceError   display excludenl "\S\s\+$"ms=s+1
  " any tabs are illegal in nim
  syn match   nimSpaceError   display "\t"
endif

if s:nim_highlight_special_vars
  syn keyword nimSpecialVar result
endif

syn sync match nimSync grouphere NONE "):$"
syn sync maxlines=200
syn sync minlines=2000

hi def link nimBrackets     Operator
hi def link nimKeyword      Keyword
hi def link nimFunction     Function
hi def link nimConditional  Conditional
hi def link nimRepeat       Repeat
hi def link nimString       String
hi def link nimRawString    String
hi def link nimBoolean      Boolean
hi def link nimEscape       Special
hi def link nimOperator     Operator
hi def link nimPreCondit    PreCondit
hi def link nimComment      Comment
hi def link nimTodo         Todo
hi def link nimDecorator    Define
hi def link nimSpecialVar   Identifier

if s:nim_highlight_numbers == 1
  hi def link nimNumber     Number
endif

if s:nim_highlight_builtins == 1
  hi def link nimBuiltin    Number
endif

if s:nim_highlight_exceptions == 1
  hi def link nimException  Exception
  hi def link nimError      Exception
  hi def link nimDefect     Exception
endif

if s:nim_highlight_space_errors == 1
  hi def link nimSpaceError Error
endif

let b:current_syntax = 'nim'

