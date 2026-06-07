
<#PSScriptInfo

.VERSION 0.1.2

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

	class											 ValidateUnionException:System.Runtime.InteropServices.ExternalException
		{											 ValidateUnionException	($message)
		:															base	($message){}}
	class											 ValidateUnionAttribute
	:					System.Management.Automation.ValidateArgumentsAttribute
		{[object[]	]								$Types													;
		 											 ValidateUnionAttribute									`
			([type]																		$single			)
			{								$this.	 Types					=@(			$single		)	} # n=1
		 											 ValidateUnionAttribute									`
			([type]																		$first			`
			,[type]																		$second			)
			{								$this.	 Types					=@(			$first		`
				,																		$second		)	} # n=2
		 											 ValidateUnionAttribute	`
			([type]																		$first			`
			,[type]																		$second			`
			,[type]																		$third			)
			{								$this.	 Types					=@(			$first		`
				,																		$second		`
				,																		$third		)	} # n=3
		 											 ValidateUnionAttribute	`
			([type]																		$first			`
			,[type]																		$second			`
			,[type]																		$third			`
			,[type]																		$fourth			)
			{								$this.	 Types					=@(			$first		`
				,																		$second		`
				,																		$third		`
				,																		$fourth		)	} # n=4
		 											 ValidateUnionAttribute	`
			([type]																		$first			`
			,[type]																		$second			`
			,[type]																		$third			`
			,[type]																		$fourth			`
			,[type]																		$fifth			)
			{								$this.	 Types					=@(			$first		`
				,																		$second		`
				,																		$third		`
				,																		$fourth		`
				,																		$fifth		)	} #n=5
		 											 ValidateUnionAttribute	`
			([type]																		$first			`
			,[type]																		$second			`
			,[type]																		$third			`
			,[type]																		$fourth			`
			,[type]																		$fifth			`
			,[type]																		$sixth			)
			{								$this.	 Types					=@(			$first		`
				,																		$second		`
				,																		$third		`
				,																		$fourth		`
				,																		$fifth		`
				,																		$sixth		)	} #n=6
		 											 ValidateUnionAttribute	`
			([type]																		$first			`
			,[type]																		$second			`
			,[type]																		$third			`
			,[type]																		$fourth			`
			,[type]																		$fifth			`
			,[type]																		$sixth			`
			,[type]																		$seventh		)
			{								$this.	 Types					=@(			$first		`
				,																		$second		`
				,																		$third		`
				,																		$fourth		`
				,																		$fifth		`
				,																		$sixth		`
				,																		$seventh	)	} #n=7
		 											 ValidateUnionAttribute	`
			([type]																		$first			`
			,[type]																		$second			`
			,[type]																		$third			`
			,[type]																		$fourth			`
			,[type]																		$fifth			`
			,[type]																		$sixth			`
			,[type]																		$seventh		`
				,																		$eighth			)
			{								$this.	 Types					=@(			$first		`
				,																		$second		`
				,																		$third		`
				,																		$fourth		`
				,																		$fifth		`
				,																		$sixth		`
				,																		$seventh	`
				,																		$eighth		)	} #n=8
		 [void		]								 Validate				([object]	$arguments		`
			,[System.Management.Automation.EngineIntrinsics]							$engineIntrinsics)
			{			foreach($arg	in @(											$arguments)	)
				{				$val = $false														;
				;		foreach($typ	in	$this.	 Types										  )	`
				  {	if(			$arg															`
					-is			$typ															)
					{			$val = $true													;
					;break																		} }
				;		if(-not	$val															  )
				  {throw						   [ValidateUnionException]::new("Type"			`
					+" "+				((	$this.	 Types|foreach-object {"[$_]"}) -join ', ')	`
					+" "+		"required"												+ ","	`
					+" "+		$arg.getType()													`
					+" "+		"given"															`
					+" "+		"in value:"														`
					+" "+		$arg															) }	}	}	}