//
//  Simple message queuing broker in C++
//  Same as request-reply broker but using QUEUE device
//
// Olivier Chamoux <olivier.chamoux@fr.thalesgroup.com>


#include "zhelpers.hpp"
#include <string>
#include <iostream>

int main (int argc, char *argv[])
{
	if(argc!=3){
		std::cout<<"Usage:"<<argv[0]<<" frontport backendport"<<std::endl;
		exit(1);
	}
	std::string front_port{"tcp://*:"};
	front_port+=argv[1];
	std::string backend_port{"tcp://*:"};
	backend_port+=argv[2];

    zmq::context_t context(1);

    //  Socket facing clients
    zmq::socket_t frontend (context, ZMQ_ROUTER);
    frontend.bind(front_port.c_str());

    //  Socket facing services
    zmq::socket_t backend (context, ZMQ_XPUB);
    backend.bind(backend_port.c_str());

    //  Start the proxy
    zmq::proxy(frontend, backend, nullptr);
    return 0;
}
