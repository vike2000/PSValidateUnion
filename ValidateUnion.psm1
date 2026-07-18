
<#PSScriptInfo

.VERSION 0.2.1

.GUID 0a96e04b-b5ee-4752-a446-8d43e2db67dc

.AUTHOR vike

.COMPANYNAME pwsh.bluelephant.dyn-o-saur.com

.COPYRIGHT (c) Viktor Bergquist

.LICENSEURI https://opensource.org/license/mit

.PROJECTURI https://github.com/vike2000/PSValidateUnion

.TAGS union type validation validate arguments attribute

#>

<# 

.DESCRIPTION
 Module main .ps1 code file.

#>

#cspell:ignore COMPANYNAME LICENSEURI PROJECTURI

	class												 ValidateUnionException:System.Runtime.InteropServices.ExternalException
		{												 ValidateUnionException	($message)
		:																base	($message){}}
	class												 ValidateUnionAttribute
	:						System.Management.Automation.ValidateArgumentsAttribute
		{	 [type[]]									$Types														;
		 												 ValidateUnionAttribute										`
			([type]																			$single				)
			{									$this.	 Types					=@(			$single			)	} # n=1
		 												 ValidateUnionAttribute										`
			([type]																			$first				`
			,[type]																			$second				)
			{									$this.	 Types					=@(			$first			`
				,																			$second			)	} # n=2
		 												 ValidateUnionAttribute										`
			([type]																			$first				`
			,[type]																			$second				`
			,[type]																			$third				)
			{									$this.	 Types					=@(			$first			`
				,																			$second			`
				,																			$third			)	} # n=3
		 												 ValidateUnionAttribute										`
			([type]																			$first				`
			,[type]																			$second				`
			,[type]																			$third				`
			,[type]																			$fourth				)
			{									$this.	 Types					=@(			$first			`
				,																			$second			`
				,																			$third			`
				,																			$fourth			)	} # n=4
		 												 ValidateUnionAttribute										`
			([type]																			$first				`
			,[type]																			$second				`
			,[type]																			$third				`
			,[type]																			$fourth				`
			,[type]																			$fifth				)
			{									$this.	 Types					=@(			$first			`
				,																			$second			`
				,																			$third			`
				,																			$fourth			`
				,																			$fifth			)	} #n=5
		 												 ValidateUnionAttribute										`
			([type]																			$first				`
			,[type]																			$second				`
			,[type]																			$third				`
			,[type]																			$fourth				`
			,[type]																			$fifth				`
			,[type]																			$sixth				)
			{									$this.	 Types					=@(			$first			`
				,																			$second			`
				,																			$third			`
				,																			$fourth			`
				,																			$fifth			`
				,																			$sixth			)	} #n=6
		 												 ValidateUnionAttribute										`
			([type]																			$first				`
			,[type]																			$second				`
			,[type]																			$third				`
			,[type]																			$fourth				`
			,[type]																			$fifth				`
			,[type]																			$sixth				`
			,[type]																			$seventh			)
			{									$this.	 Types					=@(			$first			`
				,																			$second			`
				,																			$third			`
				,																			$fourth			`
				,																			$fifth			`
				,																			$sixth			`
				,																			$seventh		)	} #n=7
		 												 ValidateUnionAttribute										`
			([type]																			$first				`
			,[type]																			$second				`
			,[type]																			$third				`
			,[type]																			$fourth				`
			,[type]																			$fifth				`
			,[type]																			$sixth				`
			,[type]																			$seventh			`
				,																			$eighth				)
			{									$this.	 Types					=@(			$first			`
				,																			$second			`
				,																			$third			`
				,																			$fourth			`
				,																			$fifth			`
				,																			$sixth			`
				,																			$seventh		`
				,																			$eighth			)	} #n=8
		 [void		]									 Validate				([object]	$argument			`
		 	,[System.Management.Automation.EngineIntrinsics]								$engineIntrinsics	)
			{foreach(									$type												`
				in								$this.	 Types												)
				{if	(				$argument	-is		$type											)	`
					{return																				}	}	;
			;throw								   [ValidateUnionException]::new("Type"						`
				+" "+						((	$this.	 Types|foreach-object {"[$_]"})		-join ', ')		`
				+" "+				"required"													+ ","		`
				+" "+				$argument.		  getType()												`
				+" "+				"given"																	`
				+" "+				"in value:"																`
				+" "+				$argument																)	}	}
	class												 ValidateUnionArrayItemsAttribute
	:						System.Management.Automation.ValidateArgumentsAttribute
		{	 [type[]]									$Types														;
		 												 ValidateUnionArrayItemsAttribute							`
			([type]																			$single				)
			{									$this.	 Types					=@(			$single			)	} # n=1
		 												 ValidateUnionArrayItemsAttribute							`
			([type]																			$first				`
			,[type]																			$second				)
			{									$this.	 Types					=@(			$first			`
				,																			$second			)	} # n=2
		 												 ValidateUnionArrayItemsAttribute							`
			([type]																			$first				`
			,[type]																			$second				`
			,[type]																			$third				)
			{									$this.	 Types					=@(			$first			`
				,																			$second			`
				,																			$third			)	} # n=3
		 												 ValidateUnionArrayItemsAttribute							`
			([type]																			$first				`
			,[type]																			$second				`
			,[type]																			$third				`
			,[type]																			$fourth				)
			{									$this.	 Types					=@(			$first			`
				,																			$second			`
				,																			$third			`
				,																			$fourth			)	} # n=4
		 												 ValidateUnionArrayItemsAttribute							`
			([type]																			$first				`
			,[type]																			$second				`
			,[type]																			$third				`
			,[type]																			$fourth				`
			,[type]																			$fifth				)
			{									$this.	 Types					=@(			$first			`
				,																			$second			`
				,																			$third			`
				,																			$fourth			`
				,																			$fifth			)	} #n=5
		 												 ValidateUnionArrayItemsAttribute							`
			([type]																			$first				`
			,[type]																			$second				`
			,[type]																			$third				`
			,[type]																			$fourth				`
			,[type]																			$fifth				`
			,[type]																			$sixth				)
			{									$this.	 Types					=@(			$first			`
				,																			$second			`
				,																			$third			`
				,																			$fourth			`
				,																			$fifth			`
				,																			$sixth			)	} #n=6
		 												 ValidateUnionArrayItemsAttribute							`
			([type]																			$first				`
			,[type]																			$second				`
			,[type]																			$third				`
			,[type]																			$fourth				`
			,[type]																			$fifth				`
			,[type]																			$sixth				`
			,[type]																			$seventh			)
			{									$this.	 Types					=@(			$first			`
				,																			$second			`
				,																			$third			`
				,																			$fourth			`
				,																			$fifth			`
				,																			$sixth			`
				,																			$seventh		)	} #n=7
		 												 ValidateUnionArrayItemsAttribute							`
			([type]																			$first				`
			,[type]																			$second				`
			,[type]																			$third				`
			,[type]																			$fourth				`
			,[type]																			$fifth				`
			,[type]																			$sixth				`
			,[type]																			$seventh			`
				,																			$eighth				)
			{									$this.	 Types					=@(			$first			`
				,																			$second			`
				,																			$third			`
				,																			$fourth			`
				,																			$fifth			`
				,																			$sixth			`
				,																			$seventh		`
				,																			$eighth			)	} #n=8
		 [void		]									 Validate				([object]	$argument			`
		 	,[System.Management.Automation.EngineIntrinsics]								$engineIntrinsics	)
			{if	(																			$argument		`
				-is																			[object[]]		`
				-and																0	-eq	$argument.count	)	`
				{			return																			}	;
			;						$item_serial=0																;
			;						$valid = $false																;
			;		foreach(		$item in $argument														)	`
				{					$valid = $false															;
				;					$item_serial++															;
				;	foreach(							$type											`
					in							$this.	 Types											)
					{if	(			$item		-is		$type										)	`
						{			$valid = $true													;
						;	break																	}	}	;
				;if	(			!	$valid																)	`
					{		break																		}	}	;
			;if	(				!	$valid																	)	`
				{throw						   [ValidateUnionException]::new("Type"						`
					+" "+					((	$this.	 Types|foreach-object {"[$_]"})		-join ', ')	`
					+" "+			"required"													+ ","	`
					+" "+			$item.			  getType()											`
					+" "+			"given"																`
					+" "+			"in item number"													`
					+" "+			$item_serial														`
					+" "+"with"+" "+   "value:"															`
					+" "+			$item																)	}	}	}