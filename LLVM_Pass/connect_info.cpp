#include <iostream>
#include <fstream>
#include <exception>
#include <sstream>
#include <string>
#include <vector>


class Connector {
private:
    std::fstream static_info_;
    std::fstream dynamic_info_;

    std::vector<std::pair<long int, std::string>> info_{};

public:
    Connector(const std::string& static_file, const std::string& dynamic_file) :
    static_info_(static_file, std::ios_base::app), 
    dynamic_info_(dynamic_file, std::ios_base::in) {}

    void pick_out_dynamic_info();
    void add_dynamic_info();
};

// void binOptLogger(int val, int arg0, int arg1, char* opName, char* funcName, long int valID){
//     std::pair<long int, std::string> tmp;

//     tmp.first = valID;
//     tmp.second = std::to_string(val) + " = " + std::to_string(arg0) + " " + std::string(opName) + " " + std::to_string(arg1);

//     Logger::dynamic_info.push_back(tmp);
// }

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
                std::cout << "FOUNDED!\n";

                ss >> search >> tmp.first >> val >> equal >> arg0 >> opname >> arg1;
                tmp.second = std::to_string(val) + " = " + std::to_string(arg0) + " " + std::string(opname) + " " + std::to_string(arg1);

                std::cout << tmp.first << std::endl << tmp.second << std::endl;
                info_.push_back(tmp);
            }
        }
    }
    else {
        throw std::runtime_error("can't open file\n");
    }
}

void Connector::add_dynamic_info() {
    
}

int main() {

    Connector connector("log.dot", "dynamic_info.txt");
    try {
        connector.pick_out_dynamic_info();
    }
    catch (std::runtime_error error) {
        std::cout << error.what() << std::endl;
    }

    return 0;
}