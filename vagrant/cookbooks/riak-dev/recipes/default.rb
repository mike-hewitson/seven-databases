bash "install_riak_dev" do
  code <<-EOH
  		cd /home/vagrant
		curl -O https://raw.githubusercontent.com/spawngrid/kerl/master/kerl
		chmod a+x kerl
		sudo apt-get update
		sudo apt-get -y install build-essential autoconf libncurses5-dev openssl libssl-dev fop xsltproc unixodbc-dev git
		sudo apt-get -y install libpam0g-dev
		
		cd /home/vagrant
		wget http://s3.amazonaws.com/downloads.basho.com/erlang/otp_src_R16B02-basho8.tar.gz
		tar zxvf otp_src_R16B02-basho8.tar.gz
		cd OTP_R16B02_basho8
		./otp_build autoconf
		./configure && make && sudo make install

		cd /home/vagrant
		mkdir -p Projects/basho
		cd Projects/basho
		git clone git://github.com/basho/riak.git
		cd riak
		make locked-deps
		make devrel DEVNODES=3

  EOH
end