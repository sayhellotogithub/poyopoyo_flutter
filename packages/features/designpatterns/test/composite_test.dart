// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/27
// Description:
// -------------------------------------------------------------------
import 'package:design_patterns/src/file_system_node.dart';

void main() {
  var root = DirectoryNode("root");
  root.add(FileNode("file1.txt"));
  var subDir = DirectoryNode("sub");
  subDir.add(FileNode("file2.txt"));
  root.add(subDir);

  root.display("");
}
