#include <stdio.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdbool.h>

#define DEF_MODE S_IRUSR | S_IWUSR | S_IRGRP | S_IWGRP | S_IROTH | S_IWOTH
#define DEF_UMASK S_IWGRP | S_IWUSR

#define MAX_SIZE 128

int main()
{

	while (true) {
		printf("1. Create a file\n");
		printf("2. Open a file\n");
		printf("3. Read from a file\n");
		printf("4. Write to a file\n");
		printf("5. Seek the content from the file\n");
		printf("6. Delete a file\n");
		printf("7. Rename a file\n");
		printf("8. Copy file\n");
		printf("9. Quit\n");

		int file;

		char cmd;
		scanf(" %c", &cmd);

		switch(cmd){

			case '1':
			{
				printf("Please enter the name of a file to be created: ");
				char *filename = (char *) calloc(MAX_SIZE, sizeof(char));
				scanf(" %s", filename);

				file = open(filename, O_CREAT | O_TRUNC, DEF_MODE);

				if (file < 0) {
					printf("Could not open or create file.\n");
				}

				break;
			}
			case '2':
			{
				printf("Please enter the name of a file to be opened: ");
				
				char *filename = (char *) calloc(MAX_SIZE, sizeof(char));
				scanf(" %s", filename);

				printf("Please enter the mode in which the file will be opened:\n");
				printf("1. Read only\n");
				printf("2. Write only\n");
				printf("3. Read & Write\n");
				
        char mode;
				scanf(" %c", &mode);

				if (mode == '1') {
					file = open(filename, O_RDONLY, 0);
				} else if (mode == '2') {
					file = open(filename, O_WRONLY, 0);
				} else if (mode == '3') {
					file = open(filename, O_RDWR, 0);
				} else {
					printf ("Invalid mode\n");
				}

				if (file < 0) {
					printf("Could not open or create file.\n");
					break;
				}
				break;
			}
			case '3':
			{
				printf("Please enter the number of bytes to be read from the file\n");
				int bytes;
				scanf(" %d", &bytes);
				
				char *buffer = (char *)calloc(bytes, sizeof(char));
				read(file, buffer, bytes);
				
				printf("The output is\n");
				printf("%s", buffer);
				break;
			}
			case '4':
			{
				printf("Please enter the text to be written to the file\n");
				char *text = (char *)calloc(MAX_SIZE, sizeof(char));
				
				scanf(" %s", text);

			  if (write(file, text, MAX_SIZE) != MAX_SIZE) {
					printf("The problem occurred while writing to a file.\n");
					break;
				}

				printf("The text has successfully been written to a file.\n");
				break;
			}
			case '5':
			{
				printf("Please choose the origin\n");
				printf("1. Beginning\n");
				printf("2. Current position\n");
				printf("3. End\n");
				char selectedPosition;
				int position;
				scanf(" %c", &selectedPosition);
				if (selectedPosition == '1') {
					position = 0;
				} else if (selectedPosition == '2') {
					position = 1;
				} else if (selectedPosition = '3') {
					position = 2;
				} else {
					printf("Invalid position\n");
				}
				
				printf("How many bytes you want to skip?\n");
				int offset;
				scanf(" %d", &offset);
				
				
				lseek(file, offset, position);
				
				printf("Please indicate whether you want to write or read from the origin\n");
				printf("1. Read\n");
				printf("2. Write\n");
				char selectedMode;
				scanf(" %c", &selectedMode);
				
				switch(selectedMode) {
					case '1': {
						printf("Please enter the number of bytes you want to read from the file\n");
						int bytes;
						scanf(" %d", &bytes);
						
						char *buffer = (char *)calloc(bytes, sizeof(char));
						read(file, buffer, bytes);
						
						printf("%s", buffer);
						break;
					}
					case '2': {
						printf("Please enter the text you want to write to a file\n");
						
						char *text = (char *)calloc(MAX_SIZE, sizeof(char));
						scanf(" %s", text);
						
						write(file, text, 512);
						break;
					}
					default: {
						printf("Invalid mode\n");
						break;
					}
				}
				
				
				break;
			}
			case '6':
			{
			  printf("Please enter the name of a file to be deleted\n");
			  char *sourceFile = (char *) calloc(64, sizeof(char));
			  scanf(" %s", sourceFile);
			  printf("%s", sourceFile);
			  unlink(sourceFile);
				break;
			}
			case '7':
			{
			  char *oldFile = (char *) calloc(64, sizeof(char));
			  char *newFile = (char *) calloc(64, sizeof(char));
			  printf("Please enter the old name of the file\n");
			  scanf(" %s", oldFile);
			  printf("Please enter the new name of the file\n");
			  scanf(" %s", newFile);
			  rename(oldFile, newFile);
				break;
      }
			case '8':
			{
			  printf("Please enter the name of a file to be copied\n");
			  char *sourceFilename = (char *)calloc(MAX_SIZE, sizeof(char));
			  scanf(" %s", sourceFilename);
			  int sourceFile = open(sourceFilename, O_RDONLY, 0);
			  
        printf("Please enter the name of a new file\n");
			  char *destinationFilename = (char *)calloc(MAX_SIZE, sizeof(char));
			  scanf(" %s", destinationFilename);
			  int destinationFile = open(destinationFilename, O_CREAT | O_WRONLY, DEF_MODE);
			  
			  char buf;
			  while(read(sourceFile, &buf, 1) != 0) {
			    printf("reading writing\n");
			    write(destinationFile, &buf, 1);
			  }
			  
				break;
			}
			case '9':
			{
			  close(file);
  			break;
			}
			default:
			{
				printf("Invalid command\n");
				break;
			}
		}
	}
	return 0;
}
