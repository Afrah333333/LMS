import 'package:flutter/material.dart';

class StudentSubject extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                padding: EdgeInsets.all(16),
                children: [
                  _buildCard(context, 'Physics', Icons.people, onPressed: () {}),
                  _buildCard(context, 'Biology', Icons.science, onPressed: () {}),
                  _buildCard(context, 'Mathematics', Icons.class_, onPressed: () {}),
                  _buildCard(context, 'English', Icons.book, onPressed: () {}),
                  _buildCard(context, 'IT', Icons.computer, onPressed: () {}),
                  _buildCard(context, 'Geography', Icons.water, onPressed: () {}),
                ],
              ),
            ),
          ],
        ),
    );
  }

  Widget _buildCard(BuildContext context, String title, IconData icon, {VoidCallback? onPressed}) {
    return InkWell(
      onTap: onPressed,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(26.0),
        child: Card(
          color: Colors.green.shade700,
          elevation: 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 48,
                color:Colors.black,
              ),
              SizedBox(height: 16),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: LinearProgressIndicator(value: 10,
                backgroundColor: Colors.white,
                color: Colors.black45,
                borderRadius: BorderRadius.circular(16.0),),
              )
            ],
          ),
        ),
      ),
    );
  }
}