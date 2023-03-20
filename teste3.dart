

void main(){
  
String input = "Hello";
List<String> substrings = input.split('');
String output = "";
for (int i = substrings.length - 1; i >= 0; i--) {
  output += substrings[i];
}
print(output);

}