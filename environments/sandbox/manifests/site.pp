node 'default' {
	

	}
	

node /^centos7/ {
	
		class {"centos7base":}
	}


node /^ubuntu/ {
	
		class {"ubuntu14base":}
	}
	

node /^rails/
{

	
	class {"ubuntu14base":} ->
	class {"nodejs":} ->
	class {"railspassenger":} ->
	class {"nginx":} ->
	class {"rubyrails":} ->
	class {"rhelloworldapp":}

}

node /^ulxjenkins/
{
	class {"ubuntu14base":} ->
	class {"jenkins":}
}


node /^win2012/
{
	class{"win12base":}
}

node /^web2012/
{
	class{"win12base":} ->
	class{"winiis":} ->
	class{"ahelloworld":}
}
