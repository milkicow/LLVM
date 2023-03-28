#include "connect_info.hpp"

void Connector::pick_out_dynamic_info() {

    std::string line;
    std::string search = "[LOG]";

    if (dynamic_info_.is_open()) {

        std::pair<long int, std::string> tmp;
        int val, arg0, arg1;
        std::string equal, opname;

        while(!dynamic_info_.eof()) {
            getline(dynamic_info_, line);
            std::stringstream ss(line);

            if (line.find(search) != std::string::npos) {
                //std::cout << "FOUNDED!\n";

                ss >> search >> tmp.first >> val >> equal >> arg0 >> opname >> arg1;
                tmp.second = std::to_string(val) + " = " + std::to_string(arg0) + " " + std::string(opname) + " " + std::to_string(arg1);

                //std::cout << tmp.first << std::endl << tmp.second << std::endl;
                info_.push_back(tmp);
            }
        }
    }
    else {
        throw std::runtime_error("can't open file: \"dynamic_info_\"\n");
    }
}

void Connector::connect_static_dynamic() {

    final_info_.open("../info/info.dot", std::ios_base::out);

    if (!final_info_.is_open())   { throw std::runtime_error("can't open file: \"final_info_\"\n");   }
    if (!static_info_.is_open())  { throw std::runtime_error("can't open file: \"static_info_\"\n");  }

    static_info_.seekp(0, std::ios_base::beg);

    std::string line;
    std::string end_of_line = " \"]";

    while (!static_info_.eof()) {
        getline(static_info_, line);

        for (auto it = info_.begin(); it != info_.end(); ++it) {
            if (line.find(std::to_string(it->first)) != std::string::npos && line.find("->") == std::string::npos) {

                //std::cout << "can connect " << it->first << std::endl;

                end_of_line = line.substr(line.find_last_of("\""));
                line = line.substr(0, line.find_last_of("\""));
                
                line = line + " | " + it->second + end_of_line;
                //std::cout << "now line = " << line << std::endl;
            }
        }

        final_info_ << line << std::endl;
    }
}

int main() {

    Connector connector("../info/static_info.txt", "../info/dynamic_info.txt");
    try {
        connector.pick_out_dynamic_info();
        connector.connect_static_dynamic();
    }
    catch (std::runtime_error error) {
        std::cout << error.what() << std::endl;
    }

    return 0;
}