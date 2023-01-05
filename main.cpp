#include <iostream>
#include <cstring>
#include <cstdlib>
#include <unistd.h>
#include <curl/curl.h>

int main(int argc, char* argv[]) {
    // Check the number of arguments
    if (argc != 3) {
        std::cerr << "Usage: " << argv[0] << " <URL> <permission>" << std::endl;
        return 1;
    }

    // Parse the arguments
    char* url = argv[1];
    char* permission = argv[2];

    // Initialize cURL
    CURL* curl = curl_easy_init();
    if (curl == nullptr) {
        std::cerr << "Error: Failed to initialize cURL" << std::endl;
        return 1;
    }

    // Set the URL
    curl_easy_setopt(curl, CURLOPT_URL, url);

    // Set the request method to POST
    curl_easy_setopt(curl, CURLOPT_POST, 1);

    // Set the data to send in the request
    char data[256];
    sprintf(data, "permission=%s", permission);
    curl_easy_setopt(curl, CURLOPT_POSTFIELDS, data);

    // Send the request
    CURLcode res = curl_easy_perform(curl);
    if (res != CURLE_OK) {
        std::cerr << "Error: Failed to send request (" << res << ")" << std::endl;
        return 1;
    }

    // Clean up cURL
    curl_easy_cleanup(curl);

    return 0;
}
