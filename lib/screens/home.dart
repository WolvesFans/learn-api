import 'package:flutter/material.dart';
import 'package:learn_weather_api/providers/weather_provider.dart';
import 'package:learn_weather_api/utils/constants/colors.dart';
import 'package:learn_weather_api/utils/constants/sizes.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        final provider = WeatherProvider();
        provider.fetchWeather('Bandung');
        return provider;
      },
      child: Scaffold(
        backgroundColor: TColors.black,
        body: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Consumer<WeatherProvider>(
            builder: (context, provider, child) {
              if (provider.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (provider.error != null) {
                return Center(
                  child: Text(
                    provider.error!,
                  ),
                );
              }
              final weather = provider.weather;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: double.infinity),
                  //place
                  Text(
                    weather!.city,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  //temperature
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${weather.temperature}°',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      const SizedBox(width: TSizes.spaceBtwItems),
                      Text(
                        'Feels like',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(width: TSizes.spaceBtwItems),
                      Text(
                        '${weather.feelsLike}°',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  Text(
                    'Look at another place',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  //another place option
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Provider.of<WeatherProvider>(context, listen: false).fetchWeather('Jakarta');
                        },
                        child: Text(
                          'Jakarta',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      const SizedBox(width: TSizes.spaceBtwItems),
                      TextButton(
                        onPressed: () {
                          Provider.of<WeatherProvider>(context, listen: false).fetchWeather('Sydney');
                        },
                        child: Text(
                          'Sydney',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      const SizedBox(width: TSizes.spaceBtwItems),
                      TextButton(
                        onPressed: () {
                          Provider.of<WeatherProvider>(context, listen: false).fetchWeather('Bandung');
                        },
                        child: Text(
                          'Bandung',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                    ],
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
