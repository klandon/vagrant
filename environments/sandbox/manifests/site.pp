node 'default' {
	

	}
	

node /^centos/ {
	
		class {"centosbase":}
	}


node /^ubuntu/ {
	
		class {"ubuntu14base":}
	}
	

node /^npm/ {
	
		class {"centosbase":} ->
		class {"clxnodejs":} ->
		class {"npm":}
	}

node /^rails/
{

	
	class {"ubuntu14base":} ->
	class {"ulxnodejs":} ->
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
