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

    std::fstream final_info_;

    std::vector<std::pair<long int, std::string>> info_{};

public:
    Connector(const std::string& static_file, const std::string& dynamic_file) :
    static_info_(static_file, std::ios_base::in), 
    dynamic_info_(dynamic_file, std::ios_base::in) {}

    void pick_out_dynamic_info();
    void connect_static_dynamic();
};
