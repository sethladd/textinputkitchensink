enum ShowcaseScenario {
  login(
    title: 'Login',
    description: 'Demonstrate login form with email and password fields',
  ),
  purchase(
    title: 'Purchase',
    description: 'Showcase purchase form with autofill capabilities',
  ),
  profile(
    title: 'Profile Creation',
    description: 'Multi-field data entry form for profile creation',
  ),
  chat(title: 'Chat', description: 'Message input field with send button'),
  search(title: 'Search', description: 'Search bar with clear button'),
  review(title: 'Review', description: 'Review form with title and body'),
  settings(title: 'Settings', description: 'Profile editing form in settings'),
  calendar(
    title: 'Calendar Event',
    description: 'Calendar event creation form',
  ),
  socialPost(title: 'Social Post', description: 'Social media post creation'),
  copyPaste(
    title: 'Copy & Paste',
    description: 'Test copy and paste functionality',
  );

  final String title;
  final String description;

  const ShowcaseScenario({required this.title, required this.description});
}
