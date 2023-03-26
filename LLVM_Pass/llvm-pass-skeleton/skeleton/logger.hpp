#pragma once
#include <iostream>
#include <fstream>
#include <stdlib.h>

class Logger
{
private:
    Logger(const std::string& file, std::error_code& EC) : stream_(file, EC) {
        if (!stream_.has_error()) {
            stream_ << "digraph LLVM {\n";
            std::cout << "constructor\n";
        }
        else {
            throw std::runtime_error("can't open file\n");
        }
    }

    llvm::raw_fd_ostream stream_;

public:
    Logger(Logger &other) = delete;
    void operator=(const Logger &) = delete;

    static Logger *get_instance(const std::string& file);

    llvm::raw_fd_ostream& get_stream() { 
        return stream_; 
    }

    void wrap_file();

    void funcStartLogger(char* funcName);
    void funcEndLogger(char* funcName, long int valID);
    void binOptLogger(int val, int arg0, int arg1, char* opName, char* funcName, long int valID);
    void callLogger(char* calleeName, char* callerName, long int valID);

    ~Logger() {
        stream_ << "\n}";
        stream_.close();
        std::cout << "destructor\n";
    }

};

Logger * Logger::get_instance(const std::string& file) {
    std::error_code EC;
    static Logger instance{file, EC};
    std::cout << "new logger was created: " << &instance << std::endl;
    return &instance;
}

