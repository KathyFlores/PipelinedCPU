#include <fstream>
#include <string>
#include <iostream>
using namespace std;

int main()
{
    ifstream infile;
    infile.open("debug.txt");
    ofstream outfile;
    outfile.open("debug.hex");
    //string buffer;
    char c;
    //outfile<<"memory_initialization_radix=16;"<<endl<<"memory_initialization_vector="<<endl;
    for(int i=0;i<52;i++)
    {
        for(int j=0;j<80;j++)
        {
            c = infile.get();
            if(c == '\n')
            	continue;
            outfile<<hex<<(int)c<<endl;
        }

        infile.get();
    }

}
