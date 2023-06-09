import 'dart:math';

import 'package:flutter/material.dart';

class DummyData {
  static List chart = [
    {
      'image':
          'https://i0.wp.com/bintankab.bawaslu.go.id/wp-content/uploads/2022/08/Perindo.webp?w=800&ssl=1',
      'name': 'DNA',
      'positive': Random().nextDouble() * 1000 + 1,
      'negative': Random().nextDouble() * 1000 + 1,
      'neutral': Random().nextDouble() * 1000 + 1,
      'social': Random().nextDouble() * 1000 + 1,
      'hashtag': Random().nextDouble() * 1000 + 1,
      'color': Colors.primaries[Random().nextInt(Colors.primaries.length)],
    },
    {
      'image':
          'https://i0.wp.com/bintankab.bawaslu.go.id/wp-content/uploads/2022/08/PDIP.webp?w=800&ssl=1',
      'name': 'PDIP',
      'positive': Random().nextDouble() * 1000 + 1,
      'negative': Random().nextDouble() * 1000 + 1,
      'neutral': Random().nextDouble() * 1000 + 1,
      'social': Random().nextDouble() * 1000 + 1,
      'hashtag': Random().nextDouble() * 1000 + 1,
      'color': Colors.primaries[Random().nextInt(Colors.primaries.length)],
    },
    {
      'image':
          'https://i0.wp.com/bintankab.bawaslu.go.id/wp-content/uploads/2022/08/PKP.webp?w=800&ssl=1',
      'name': 'PKS',
      'positive': Random().nextDouble() * 1000 + 1,
      'negative': Random().nextDouble() * 1000 + 1,
      'neutral': Random().nextDouble() * 1000 + 1,
      'social': Random().nextDouble() * 1000 + 1,
      'hashtag': Random().nextDouble() * 1000 + 1,
      'color': Colors.primaries[Random().nextInt(Colors.primaries.length)],
    },
    {
      'image':
          'https://i0.wp.com/bintankab.bawaslu.go.id/wp-content/uploads/2022/08/PBB.webp?w=800&ssl=1',
      'name': 'ADS',
      'positive': Random().nextDouble() * 1000 + 1,
      'negative': Random().nextDouble() * 1000 + 1,
      'neutral': Random().nextDouble() * 1000 + 1,
      'social': Random().nextDouble() * 1000 + 1,
      'hashtag': Random().nextDouble() * 1000 + 1,
      'color': Colors.primaries[Random().nextInt(Colors.primaries.length)],
    },
    {
      'image':
          'https://i0.wp.com/bintankab.bawaslu.go.id/wp-content/uploads/2022/08/Nasdem.webp?w=800&ssl=1',
      'name': 'PAN',
      'positive': Random().nextDouble() * 1000 + 1,
      'negative': Random().nextDouble() * 1000 + 1,
      'neutral': Random().nextDouble() * 1000 + 1,
      'social': Random().nextDouble() * 1000 + 1,
      'hashtag': Random().nextDouble() * 1000 + 1,
      'color': Colors.primaries[Random().nextInt(Colors.primaries.length)],
    },
    {
      'image':
          'https://i0.wp.com/bintankab.bawaslu.go.id/wp-content/uploads/2022/08/Garuda.webp?w=800&ssl=1',
      'name': 'PKB',
      'positive': Random().nextDouble() * 1000 + 1,
      'negative': Random().nextDouble() * 1000 + 1,
      'neutral': Random().nextDouble() * 1000 + 1,
      'social': Random().nextDouble() * 1000 + 1,
      'hashtag': Random().nextDouble() * 1000 + 1,
      'color': Colors.primaries[Random().nextInt(Colors.primaries.length)],
    },
    {
      'image':
          'https://i0.wp.com/bintankab.bawaslu.go.id/wp-content/uploads/2022/08/Garuda.webp?w=800&ssl=1',
      'name': 'RT',
      'positive': Random().nextDouble() * 1000 + 1,
      'negative': Random().nextDouble() * 1000 + 1,
      'neutral': Random().nextDouble() * 1000 + 1,
      'social': Random().nextDouble() * 1000 + 1,
      'hashtag': Random().nextDouble() * 1000 + 1,
      'color': Colors.primaries[Random().nextInt(Colors.primaries.length)],
    },
    {
      'image':
          'https://i0.wp.com/bintankab.bawaslu.go.id/wp-content/uploads/2022/08/Perindo.webp?w=800&ssl=1',
      'name': 'ADN',
      'positive': Random().nextDouble() * 1000 + 1,
      'negative': Random().nextDouble() * 1000 + 1,
      'neutral': Random().nextDouble() * 1000 + 1,
      'social': Random().nextDouble() * 1000 + 1,
      'hashtag': Random().nextDouble() * 1000 + 1,
      'color': Colors.primaries[Random().nextInt(Colors.primaries.length)],
    },
    {
      'image':
          'https://i0.wp.com/bintankab.bawaslu.go.id/wp-content/uploads/2022/08/PDIP.webp?w=800&ssl=1',
      'name': 'PDP',
      'positive': Random().nextDouble() * 1000 + 1,
      'negative': Random().nextDouble() * 1000 + 1,
      'neutral': Random().nextDouble() * 1000 + 1,
      'social': Random().nextDouble() * 1000 + 1,
      'hashtag': Random().nextDouble() * 1000 + 1,
      'color': Colors.primaries[Random().nextInt(Colors.primaries.length)],
    },
    {
      'image':
          'https://i0.wp.com/bintankab.bawaslu.go.id/wp-content/uploads/2022/08/PKP.webp?w=800&ssl=1',
      'name': 'PSS',
      'positive': Random().nextDouble() * 1000 + 1,
      'negative': Random().nextDouble() * 1000 + 1,
      'neutral': Random().nextDouble() * 1000 + 1,
      'social': Random().nextDouble() * 1000 + 1,
      'hashtag': Random().nextDouble() * 1000 + 1,
      'color': Colors.primaries[Random().nextInt(Colors.primaries.length)],
    },
    {
      'image':
          'https://i0.wp.com/bintankab.bawaslu.go.id/wp-content/uploads/2022/08/PBB.webp?w=800&ssl=1',
      'name': 'ASD',
      'positive': Random().nextDouble() * 1000 + 1,
      'negative': Random().nextDouble() * 1000 + 1,
      'neutral': Random().nextDouble() * 1000 + 1,
      'social': Random().nextDouble() * 1000 + 1,
      'hashtag': Random().nextDouble() * 1000 + 1,
      'color': Colors.primaries[Random().nextInt(Colors.primaries.length)],
    },
    {
      'image':
          'https://i0.wp.com/bintankab.bawaslu.go.id/wp-content/uploads/2022/08/Nasdem.webp?w=800&ssl=1',
      'name': 'RAN',
      'positive': Random().nextDouble() * 1000 + 1,
      'negative': Random().nextDouble() * 1000 + 1,
      'neutral': Random().nextDouble() * 1000 + 1,
      'social': Random().nextDouble() * 1000 + 1,
      'hashtag': Random().nextDouble() * 1000 + 1,
      'color': Colors.primaries[Random().nextInt(Colors.primaries.length)],
    },
  ];
}
