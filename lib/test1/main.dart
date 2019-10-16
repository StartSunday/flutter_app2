
void main(){
  var str1 = "OK";
  print(str1);
  var str2 = "It's ok!";
  print(str2);
  var str3 = """Dart Lang 
  HellWorld!""";
  print(str3);
  var str4 = 'Wang'' ''Jianfei';
  print(str4);
  assert(str4 == "Wang Jianfei");
  print(str4);
  print("Name:$str4");
  print(r"换行符：\n");

  var hex =0xDEADBEEF;
  print("整形转换为16进制：$hex ->0x${hex.toRadixString(16).toUpperCase()}");
}