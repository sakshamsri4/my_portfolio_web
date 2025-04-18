import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio_web/app/routes/app_pages.dart';
import 'package:my_portfolio_web/app/modules/contact/controllers/contact_controller.dart';

class ContactView extends GetView<ContactController> {
  const ContactView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Me'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: Get.back,
        ),
      ),
      body: buildContactViewBody(),
    );
  }

  Widget buildContactViewBody() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Contact Me',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          const Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.email, size: 30),
                    title: Text('Email'),
                    subtitle: Text('s.saksham@mufin.co.kr'),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.phone, size: 30),
                    title: Text('Phone'),
                    subtitle: Text('+91 1234567890'),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.location_on, size: 30),
                    title: Text('Location'),
                    subtitle: Text('India'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Send a Message',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          const TextField(
            maxLines: 4,
            decoration: InputDecoration(
              labelText: 'Message',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Send Message'),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                onPressed: () => Get.toNamed(Routes.HOME),
                icon: const Icon(Icons.home),
                label: const Text('Home'),
              ),
              ElevatedButton.icon(
                onPressed: () => Get.toNamed(Routes.ABOUT),
                icon: const Icon(Icons.person),
                label: const Text('About'),
              ),
              ElevatedButton.icon(
                onPressed: () => Get.toNamed(Routes.PROJECTS),
                icon: const Icon(Icons.work),
                label: const Text('Projects'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
