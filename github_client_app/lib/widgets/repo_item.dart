import '../index.dart';

class RepoItem extends StatefulWidget {
  RepoItem(this.repo) : super(key: ValueKey(repo.id));

  final Repo repo;

  @override
  _RepoItemState createState() => _RepoItemState();
}

class _RepoItemState extends State<RepoItem> {
  @override
  Widget build(BuildContext context) {
    var subtitle;
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Material(
        color: Colors.white,
        shape: BorderDirectional(
          bottom: BorderSide(
            color: Theme.of(context).dividerColor,
            width: .5,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 0.0, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListTile(
                dense: true,
                leading: gmAvatar(
                  //项目owner头像
                  widget.repo.owner.avatar_url,
                  width: 24.0,
                  borderRadius: BorderRadius.circular(12),
                ),
                title: Text(
                  widget.repo.owner.login,
                  textScaleFactor: .9,
                ),
                subtitle: subtitle,
                trailing: Text(widget.repo.language ?? ""),
              ),
              // 构建项目标题和简介
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.repo.fork
                          ? widget.repo.full_name
                          : widget.repo.name,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontStyle: widget.repo.fork
                            ? FontStyle.italic
                            : FontStyle.normal,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 12),
                      child: widget.repo.description == null
                          ? Text(
                              GmLocalizations.of(context).noDescription,
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.grey[700]),
                            )
                          : Text(
                              widget.repo.description,
                              maxLines: 3,
                              style: TextStyle(
                                height: 1.15,
                                color: Colors.blueGrey[700],
                                fontSize: 13,
                              ),
                            ),
                    ),
                  ],
                ),
              ),
              // 构建卡片底部信息
              _buildBottom()
            ],
          ),
        ),
      ),
    );
  }

  // 构建卡片底部信息
  Widget _buildBottom() {
    const paddingWidth = 10;
    return IconTheme(
      data: IconThemeData(
        color: Colors.grey,
        size: 15,
      ),
      child: DefaultTextStyle(
        style: TextStyle(color: Colors.grey, fontSize: 12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Builder(builder: (context) {
            var children = <Widget>[
              Icon(Icons.star),
              Text(" " +
                  widget.repo.stargazers_count
                      .toString()
                      .padRight(paddingWidth)),
              Icon(Icons.info_outline),
              Text(" " +
                  widget.repo.open_issues_count
                      .toString()
                      .padRight(paddingWidth)),

              Icon(MyIcons.fork), //我们的自定义图标
              Text(widget.repo.forks_count.toString().padRight(paddingWidth)),
            ];

            if (widget.repo.fork) {
              children.add(Text("Forked".padRight(paddingWidth)));
            }

            if (widget.repo.private == true) {
              children.addAll(<Widget>[
                Icon(Icons.lock),
                Text(" private".padRight(paddingWidth))
              ]);
            }
            return Row(children: children);
          }),
        ),
      ),
    );
  }
}
