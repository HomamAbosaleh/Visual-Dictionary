import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:visual_dictionary/ui/profile/profile_view_model.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ProfileViewModel(),
      onViewModelReady: (model) => model.init(),
      builder: (context, viewModel, child) => Scaffold(
        backgroundColor: const Color(0xFF69C7D0),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Profilim',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFEC1F52),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/images/woman.png'),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${viewModel.user.name} ${viewModel.user.surname}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '@${viewModel.user.name.toLowerCase()}${viewModel.user.surname.toLowerCase()}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFC3C3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    _buildFeatureRow(
                        Icons.person, 'Hesabım', 'Hesabında değişiklik yap!'),
                    const SizedBox(height: 10),
                    _buildFeatureRow(Icons.translate, 'Dil Tercihleri',
                        'Dil seçeneklerini yönet.'),
                    const SizedBox(height: 10),
                    _buildFeatureRow(Icons.lock, 'Nesne Tanımlama Sonuçları',
                        'Sonuçlarını yönet.'),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () => viewModel.logout(),
                      child: _buildFeatureRow(
                          Icons.exit_to_app, 'Çıkış Yap', 'Oturumu kapat.'),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Daha Fazla',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFC3C3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    _buildCenteredFeatureRow(Icons.help, 'Yardım Ve Destek'),
                    const SizedBox(height: 10),
                    _buildCenteredFeatureRow(
                        Icons.info_outline, 'Uygulama Hakkında'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureRow(IconData icon, String title, String subtitle) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: const BoxDecoration(
            color: Color(0xFF69C7D0),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: const Color(0xFFEC1F52),
            size: 32,
          ),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 14,
              ),
            ),
          ],
        ),
        const Spacer(),
        const Icon(
          Icons.arrow_right,
          color: Color(0xFFABABAB),
          size: 36,
        ),
      ],
    );
  }

  Widget _buildCenteredFeatureRow(IconData icon, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: const BoxDecoration(
            color: Color(0xFF69C7D0),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: const Color(0xFFEC1F52),
            size: 32,
          ),
        ),
        const SizedBox(width: 16),
        Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const Spacer(),
        const Icon(
          Icons.arrow_right,
          color: Color(0xFFABABAB),
          size: 36,
        ),
      ],
    );
  }
}
