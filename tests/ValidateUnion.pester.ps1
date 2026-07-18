	# verbatim from vike's personal base.ps1
	# return arguments, being an array, not having to quote strings or use commas
	# example:
	# &{$arr=@(arrgs a m z);$arr}
	function arrgs		{	if ($args.length -le 0)	{@(								 )}
						elseif ($args.length -le 1)	{@(	$args[0						])}
						else						{	$args[0..$args.length		] }} #cspell:words arrgs
	
	# support <specified> name template
	;function			s(){process{$_.specified=" of $(convertTo-psCode ($_.s[1])) it should $($_.s[3..$_.s.count]|foreach-object{$_ -replace '^-',''})";$_}}
	
	;beforeAll {
		function acceptingScriptBlockOrString(			[ValidateUnion(				[scriptBlock], [string	])] $argument){}
		function acceptingScriptBlockOrArray(			[ValidateUnion(				[scriptBlock], [array	])] $argument){}
		function acceptingArrayOfScriptBlockOrString(	[ValidateUnionArrayItems(	[scriptBlock], [string	])] $argument){}
		function acceptingArrayOfScriptBlockOrArray(	[ValidateUnionArrayItems(	[scriptBlock], [array	])] $argument){}}
	
	;describe "ValidateUnion"																																																																		`
		{it "given a valid argument$(	)<specified>"																																																									-foreach	`
			(  @(	@{	 s=@(arrgs acceptingScriptBlockOrString			{test}			should -not	-throw																																												)}	`
			,  		@{	 s=@(arrgs acceptingScriptBlockOrString			'test'			should -not	-throw																																												)}	`
			,  		@{	 s=@(arrgs acceptingScriptBlockOrArray			{test}			should -not	-throw																																												)}	`
			,  		@{	 s=@(arrgs acceptingScriptBlockOrArray			 @(	 )			should -not	-throw																																												)}	)|s	)	`
			{																			$a=$s[3..$s.count]																																												;
			;	{	&	$s[0]											$s[1]}|			should	@a																																																}	;
		;it "given an invalid argument$(	)<specified>"																																																								-foreach	`
			(  @(	@{	 s=@(arrgs acceptingScriptBlockOrString					 1		should		-throw -expectedMessage "Cannot validate argument on parameter 'argument'. Type ``[scriptblock``], ``[string$(	)``] required, int $(	)given in value: 1"							)}	`
			,  		@{	 s=@(arrgs acceptingScriptBlockOrString					$true	should		-throw -expectedMessage "Cannot validate argument on parameter 'argument'. Type ``[scriptblock``], ``[string$(	)``] required, bool $(	)given in value: True"						)}	`
			,  		@{	 s=@(arrgs acceptingScriptBlockOrArray					$true	should		-throw -expectedMessage "Cannot validate argument on parameter 'argument'. Type ``[scriptblock``], ``[array$(	)``] required, bool $(	)given in value: True"						)}	`
			,  		@{	 s=@(arrgs acceptingScriptBlockOrArray					 1		should		-throw -expectedMessage "Cannot validate argument on parameter 'argument'. Type ``[scriptblock``], ``[array$(	)``] required, int $(	)given in value: 1"							)}	)|s	)	`
			{																			$a=$s[3..$s.count]																																												;
			;	{	&	$s[0]											$s[1]}|			should	@a																																																}	}
	
	;describe "ValidateUnionArrayItems"																																																																		`
		{it "given a valid argument$(		)<specified>"																																																								-foreach	`
			(  @(	@{	 s=@(arrgs acceptingArrayOfScriptBlockOrString	{test},'text'	should -not	-throw																																												)}	`
			,  		@{	 s=@(arrgs acceptingArrayOfScriptBlockOrString	'test',{text}	should -not	-throw																																												)}	`
			,  		@{	 s=@(arrgs acceptingArrayOfScriptBlockOrArray	{test},@(2,8)	should -not	-throw																																												)}	`
			,  		@{	 s=@(arrgs acceptingArrayOfScriptBlockOrArray   @(	 )			should -not	-throw																																												)}	)|s	)	`
			{																					$a=$s[3..$s.count]																																												;
			;	{	&	$s[0]											$s[1]}|			should	@a																																																}	;
		;it "given an invalid argument$(	)<specified>"																																																								-foreach	`
			(  @(	@{	 s=@(arrgs acceptingArrayOfScriptBlockOrString	{test},	 1		should		-throw -expectedMessage "Cannot validate argument on parameter 'argument'. Type ``[scriptblock``], ``[string$(	)``] required, int $(	)given in item number 2 with value: 1"		)}	`
			,  		@{	 s=@(arrgs acceptingArrayOfScriptBlockOrString	'test',	$true	should		-throw -expectedMessage "Cannot validate argument on parameter 'argument'. Type ``[scriptblock``], ``[string$(	)``] required, bool $(	)given in item number 2 with value: True"	)}	`
			,  		@{	 s=@(arrgs acceptingArrayOfScriptBlockOrArray	{test},	$true	should		-throw -expectedMessage "Cannot validate argument on parameter 'argument'. Type ``[scriptblock``], ``[array$(	)``] required, bool $(	)given in item number 2 with value: True"	)}	`
			,  		@{	 s=@(arrgs acceptingArrayOfScriptBlockOrArray	@(2,8),	 1		should		-throw -expectedMessage "Cannot validate argument on parameter 'argument'. Type ``[scriptblock``], ``[array$(	)``] required, int $(	)given in item number 2 with value: 1"		)}	)|s	)	`
			{																					$a=$s[3..$s.count]																																												;
			;	{	&	$s[0]											$s[1]}|			should	@a																																																}	}
	
	# vike's personal execution: cd1 /œ∂/ps1/com.dyn_o_saur.bluelephant.pwsh/ValidateUnion invoke-isolated -verbose -usingPathModule ./ValidateUnion.psd1 {invoke-pester tests/*}