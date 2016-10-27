/**************************main.m******************************
    NS FILE HANDLE READ & WRITE
    reading and writing in same file
    Created by abdulsathar on 6/16/14.
***************************************************************/

#import <Foundation/Foundation.h>


int main(int argc, const char * argv[])
{
   @autoreleasepool  //ARC
    {
        NSFileHandle *file;
        //object for File Handle
        NSError *error;
        //crearing error object for string with file contents format
        NSMutableData *writingdatatofile;
        //create mutable object for ns data
        NSString *filePath=[NSString stringWithFormat:@"/Users/chandrakumar/Documents/abdul/doc.txt"];
        //telling about File Path for Reading for easy of access
        file = [NSFileHandle fileHandleForReadingAtPath:@"/Users/chandrakumar/Documents/abdul/doc.txt"];
        //assign file path directory
            if (file == nil) //check file exist or not
                NSLog(@"Failed to open file");
        NSString *getfileContents = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
        //access file contents with out ns handle method
            if (error) //check error flag for file present or not
                NSLog(@"Error reading file: %@", error.localizedDescription);
        NSLog(@"contents: %@", getfileContents);
        //display file contents in main file
        NSArray *listArray = [getfileContents componentsSeparatedByString:@"\n"];
        //caluculate list of line present in files
        NSLog(@"items = %ld", [listArray count]);
        const char *writingchar = "how are you";
        writingdatatofile = [NSMutableData dataWithBytes:writingchar length:strlen(writingchar)];
        //convert string format into ns mutable data format
        file = [NSFileHandle fileHandleForUpdatingAtPath: @"/Users/chandrakumar/Documents/abdul/new.txt"];
        //set writing path to file
            if (file == nil) //check file present or not in file
                NSLog(@"Failed to open file");
        [file seekToFileOffset: 6];
        //object pointer initialy points the offset as 6 position in file
        [file writeData: writingdatatofile];
        //writing data to new file
        [file closeFile];
        //close the file
    }
    return 0;`enter code here`
}
