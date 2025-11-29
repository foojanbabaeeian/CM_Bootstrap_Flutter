import 'models/module.dart';
import 'models/lesson.dart';

const basics = Module(
  id: 'basics',
  title: 'Coding Basics',
  description: 'Learn what programs are and how to think like a coder.',
  order: 1,
);

const loops = Module(
  id: 'loops',
  title: 'Loops & Patterns',
  description: 'Repeat actions to make cool patterns.',
  order: 2,
);

const conditionals = Module(
  id: 'conditions',
  title: 'If This Then That',
  description: 'Make your code react to choices.',
  order: 3,
);

const modules = <Module>[
  basics,
  loops,
  conditionals,
];

const basicsLessons = <Lesson>[
  Lesson(
    id: 'b1',
    title: 'What is a Program?',
    content: 'A program is a list of instructions you give to a computer...',
    order: 1,
  ),
  Lesson(
    id: 'b2',
    title: 'Step by Step Thinking',
    content: 'Computers follow steps in order. You are the boss of the steps!',
    order: 2,
  ),
];

const loopsLessons = <Lesson>[
  Lesson(
    id: 'l1',
    title: 'Repeat After Me',
    content: 'Loops let you repeat actions many times with one line of code.',
    order: 1,
  ),
];

const conditionsLessons = <Lesson>[
  Lesson(
    id: 'c1',
    title: 'If It Rains...',
    content: 'Conditions let your code make choices: if this, then that!',
    order: 1,
  ),
];

const lessonsByModule = <String, List<Lesson>>{
  'basics': basicsLessons,
  'loops': loopsLessons,
  'conditions': conditionsLessons,
};
