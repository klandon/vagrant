node 'default' {
	

	}
	

node /^ubuntu/ {
	
		class {"ubuntu14":}
	}
	

node /^rails/
{

	
	class {"ubuntu14":} ->
	class {"nodejs":} ->
	class {"railspassenger":} ->
	class {"nginx":} ->
	class {"rubyrails":} ->
	class {"rhelloworldapp":}

}

node /^ulxjenkins/
{
	class {"ubuntu14":} ->
	class {"jenkins":}
}


node /^win2012/
{
	class{"winbase12":}
}

node /^web2012/
{
	class{"winbase12":} ->
	class{"winiis":} ->
	class{"ahelloworld":}
}
