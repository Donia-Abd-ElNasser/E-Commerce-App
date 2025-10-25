import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/core/routes.dart';
import 'package:ecommerce/core/shared_preference.dart';
import 'package:ecommerce/screens/profile/view/widgets/profile_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  Future<void> _signOut( context) async {
    await CacheHelper.removeData(key: 'token');
     GoRouter.of(context).go(AppRoutes.kSignupView);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
         backgroundColor: kPrimaryColor,
        automaticallyImplyLeading: false,
        bottom: PreferredSize(preferredSize: const Size.fromHeight(20), child: Padding(
          padding: const EdgeInsets.all(16),
          child: ProfileAppBar()
        )),
     
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Profile Avatar
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey,
                child: Text(
                  'U', 
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'User',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
        
              const SizedBox(height: 30),
        
              // Settings Section
              Container(
                decoration: BoxDecoration(
                  color: kButtonColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.person_outline, color: Colors.white),
                      title: Text('Account', style: TextStyle(color: Colors.white)),
                      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(Icons.settings, color: Colors.white),
                      title: Text('Settings', style: TextStyle(color: Colors.white)),
                      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                      onTap: () {},
                    ),
                    SwitchListTile(
                      value: false, 
                      onChanged: (value) {
                        
                      },
                      secondary: Icon(Icons.dark_mode, color: Colors.white),
                      title: Text('Dark Mode', style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ),
        
              const Spacer(),
        
              // Sign Out Button
              ElevatedButton.icon(
                onPressed: () => _signOut(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: kButtonColor,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                icon: Icon(Icons.logout,color: kPrimaryColor,),
                label: Text('Sign Out',style: TextStyle(color: kPrimaryColor),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
