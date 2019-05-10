import 'package:flutter/material.dart';
import 'package:icms_app/colors.dart';
import 'package:icms_app/datamodel/user.dart';
import 'package:url_launcher/url_launcher.dart';

class MerchantCard extends StatelessWidget {
  User merchant;

  MerchantCard({Key key, @required this.merchant}) : super(key: key);

  static const double height = 350.0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle =
        theme.textTheme.headline.copyWith(color: Colors.white);
    final TextStyle descriptionStyle = theme.textTheme.subhead;

    var chip = merchant.IsActivated
        ? new Chip(
            avatar: new CircleAvatar(
              backgroundColor: Colors.green.shade800,
              child: new Text('A'),
            ),
            label: new Text('Activated'),
          )
        : new Chip(
            avatar: new CircleAvatar(
              backgroundColor: cred,
              child: new Text('U'),
            ),
            label: new Text('Unactivated'),
          );

//    print(merchant.DefaultCountryId);
    return new SafeArea(
      top: false,
      bottom: false,
      child: new Container(
        decoration: Theme.of(context).platform == TargetPlatform.iOS
            ? new BoxDecoration(
//                color: theme.canvasColor,
                color: Colors.white,
                border: new Border(
                    bottom:
                        new BorderSide(color: theme.dividerColor, width: 1.5)))
            : null,
        padding: Theme.of(context).platform == TargetPlatform.iOS
            ? const EdgeInsets.all(0.0)
            : const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
        height: height,
        child: new Card(
          elevation:
              Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 2.0,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Expanded(
                child: new Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                  child: new DefaultTextStyle(
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    style: descriptionStyle,
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Padding(
                            padding: const EdgeInsets.only(bottom: 4.0),
                              child: new ListTile(
                                  leading: const Icon(Icons.person),
                                  title: Text(
                                    merchant.FirstName == null
                                        ? "Merchant Name: unavailable"
                                        : merchant.FirstName + ' ' + merchant.LastName,
                                    style: descriptionStyle.copyWith(
                                        color: Colors.black87, fontSize: 19.0
                                    ),
                                  )
                              ),
                        ),

                        new ListTile(
                          leading: const Icon(Icons.email),
                          title: Text(merchant.Email),
                        ),

                        new ListTile(
                          leading: const Icon(Icons.phone),
                          title: Text(merchant.PhoneNumber == null
                              ? "unavailabe"
                              : merchant.PhoneNumber),
                        ),
                        new ListTile(
                            leading: const Icon(Icons.store),
                            title: Text(
                              merchant.StoreName == null
                              ? "Store Name: unavailable"
                              : merchant.StoreName,
                              style: descriptionStyle.copyWith(
                                  color: Colors.black87, fontSize: 19.0
                              ),
                            ),
                            subtitle: Text(
                                merchant.StoreDescription == null
                                    ? "Store Description: unavailable"
                                    : merchant.StoreDescription,
                                overflow: TextOverflow.ellipsis,
                            )
                        )
                      ],
                    ),
                  ),
                ),
              ),

              // share, explore buttons
              new ButtonTheme.bar(
                child: new ButtonBar(
                  alignment: MainAxisAlignment.end,
                  children: <Widget>[
                    chip,
                    new FlatButton.icon(
                        icon: const Icon(Icons.call, size: 18.0),
                        label: const Text('CALL'),
                        textColor: cred,
                        onPressed: merchant.PhoneNumber != null
                            ? () {
                                _launchURL(merchant.PhoneNumber);
                              }
                            : null),
//
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _launchURL(String phoneNumber) async {
    String url = 'tel:' + phoneNumber.trim();
//    String url = 'https://flutter.io';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }
}
