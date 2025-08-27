// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/27
// Description:
// -------------------------------------------------------------------
abstract class FileSystemNode {
  void display(String indent);
}

class FileNode implements FileSystemNode {
  String name;

  FileNode(this.name);

  @override
  void display(String indent) {
    print("$indent-File:$name");
  }
}

class DirectoryNode implements FileSystemNode {
  String name;
  List<FileSystemNode> _children = [];

  DirectoryNode(this.name);

  void add(FileSystemNode node) => _children.add(node);

  void remove(FileSystemNode node) => _children.remove(node);

  @override
  void display(String indent) {
    print("$indent+ Directory: $name");
    for (var child in _children) {
      child.display("$indent  ");
    }
  }
}
