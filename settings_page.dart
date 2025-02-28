import 'package:flutter/material.dart';
import 'package:news_app/news_project/page_profile.dart';

import 'add_post_page.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          _buildListTile(Icons.person, 'Profile', context, PageProfile()),
          _buildListTile(
              Icons.account_balance_wallet, 'My Wallet', context, null),
          _buildListTile(Icons.post_add, 'My Post', context, AddPostPage()),
          _buildListTile(Icons.rocket_launch, 'Boost Your Post', context, null),
          _buildListTile(Icons.notifications, 'Notifications', context, null),
          _buildListTile(Icons.article, 'Terms and Conditions', context, null),
          _buildListTile(Icons.info, 'About', context, null),
          _buildListTile(Icons.star, 'Watch Ads & Earn', context, null),
          _buildListTile(Icons.card_giftcard, 'Refer and Earn', context, null),
          _buildListTile(Icons.logout, 'Log Out', context, null),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.tv), label: 'Ads'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle, size: 40), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.note), label: 'Post'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildListTile(
      IconData icon, String title, BuildContext context, Widget? page) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios, size: 16),
      onTap: page != null
          ? () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => page));
            }
          : null,
    );
  }
}
