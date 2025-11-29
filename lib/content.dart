import 'models/module.dart';
import 'models/lesson.dart';

const modules = <Module>[
  Module(
    id: 'basics',
    title: 'Coding Basics',
    description: 'Learn what programs are and how to think like a coder.',
    order: 1,
  ),
  Module(
    id: 'loops',
    title: 'Loops & Patterns',
    description: 'Repeat actions to make cool patterns.',
    order: 2,
  ),
  Module(
    id: 'conditions',
    title: 'If This Then That',
    description: 'Make your code react to choices.',
    order: 3,
  ),
];

const lessonsByModule = <String, List<Lesson>>{
  'basics': [
    Lesson(
      id: 'b1',
      title: 'What is a Program?',
      content: 'A program is a list of instructions you give to a computer...',
      order: 1,
    ),
    Lesson(
      id: 'b2',
      title: 'Talking to Computers',
      content: 'Computers understand very simple steps. We combine them...',
      order: 2,
    ),
  ],
  'loops': [
    Lesson(
      id: 'l1',
      title: 'Repeat After Me',
      content:
          'Loops let you repeat actions without writing them many times...',
      order: 1,
    ),
  ],
  'conditions': [
    Lesson(
      id: 'c1',
      title: 'If It Rains...',
      content: 'Conditions let you say: if this happens, then do that...',
      order: 1,
    ),
  ],
};
