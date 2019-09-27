---
layout: post
title:  "Indirect Programming"
excerpt: "<p>Changing Expectations on Machine Program Expressibility.</p>"
---

## Ada Lovelace's Section G

Sometime over the English winter of 1842&mdash;43, [Ada Lovelace](https://en.wikipedia.org/wiki/Ada_Lovelace#Work) wrote the first computer program.
Ada was writing a technical description for the [Babbage Analytical Engine](https://en.wikipedia.org/wiki/Analytical_Engine). A a concrete example of the engine's operation, tucked away in "Notes G" of the work was a program that calculated Bernoulli numbers.

In the same piece of work describing the first program, Ada&nbsp;the&nbsp;Countess&nbsp;of&nbsp;Lovelace, said:

> _"The Analytical Engine has no pretensions whatever to originate anything. It can do whatever we know how to order it to perform. It can follow analysis; but it has no power of anticipating any analytical relations or truths."_

This is the earliest instance I know of where someone defines the boundaries of machine program expressibility.

Following the logic, the _"power of anticipating ... relations or truths"_ is outside of programmable expressiblity because we do not _"... know how to order it to perform"_ the tasks.
I suspect this restriction is not intrinsic to analytical engines but to programmers.

## Turing's Imitation Game

[Alan Turing](https://en.wikipedia.org/wiki/Alan_Turing),
in [Computing Machinery and Intelligence](https://home.manhattan.edu/~tina.tian/CMPT420/Turing.pdf) (Section 1, Imitation Game)
devised a scenario that would later be known as the
[Turing Test](https://en.wikipedia.org/wiki/Turing_test).

As part of his essay, he defined the kinds of machines applicable to the game:

> _"It is natural that we should wish to permit every kind of engineering technique to be used in our machines. We also wish to allow the possibility that an engineer or team of engineers may construct a machine which works, but whose manner of operation cannot be satisfactorily described by its constructors because they applied a method which is largely experimental."_

Use of random number generators permits a kind of program that can be described, but not predicted.
Turing takes this concession a step further an allows programs that can permute in such a way as their operation is beyond the understanding of the authors.

A black-box scenario is commonplace in Machine Learning. In Deep Learning, a program is tasked with a circuit search to find another program that accomplishes a goal.
To do this, the initial program searches through a sub-space of possible programs and selects the one that performs best.
Often logic contained within the resulting program is [obscure to say the least](https://distill.pub/2018/building-blocks/).

> _"It is not normally possible to determine from observing a machine whether it has a random element, for a similar effect can be produced by such devices as making the choices depend on the digits of the decimal for $$\pi$$." -- Turing_

In Deep Learning, we define the program obliquely through providing training and test sets -- teaching by example and letting the program do the programming.

Turing afforded an additional interesting flexibility permitted in the Imitation Game, saying that:

> _"An interesting variant on the idea of a digital computer is a 'digital computer with a random element'. These have instructions involving the throwing of a die or some equivalent electronic process; ... Sometimes such a machine is described as having free will (though I would not use this phrase myself)."_

[Deep-Q-Learning](https://en.wikipedia.org/wiki/Q-learning#Deep_Q-learning) and related reinforcement learning algorithms tend to have this property (use of randomness, not free will) which is used in exploration of policy space through random sampling.
[AlphaGo Zero](https://deepmind.com/blog/alphago-zero-learning-scratch/) was able to learn the game of Go from scratch using a random search through a space with a tendency to explore directions likely to improve the performance metric.
In both of these examples, and in most Reinforcement Learning, randomness is introduced to generate statistical certainty about a solution being more appropriate on average.

## Self-expressing Programs

In the recent paper _[World Models](https://arxiv.org/pdf/1803.10122.pdf)_, David Ha and Jürgen Schmidhuber further push the bounds of program expressibility.

The agent is programmed indirectly (an environment reward signal)
to learn internally relevant representations
in order to simulate episodes (outside of the environment)
which it can learn from,
in order to improve its programming
to increase likelihood of achieving higher reward.

The program seems to have demonstrated a kind of _"power of anticipating any analytical relations or truths"_ in a very convincing way.
In the case of World Models, the machine is expressing the programming goal (what it has learned of it) as well as the program.
This seems like a promising approach for getting a machine to learn to teach itself.

## Problems with the Reward Signal

New abstractions in machine learning theory have led to a more succinct language for programming machines to perform tasks previously too complex for definition.

For simple tasks, like generating Bernoulli numbers, expressing directly is still the most effcient approach.
For the more complex tasks, those previously out of reach, we can now express an outcome by example and have the computer fill in the gaps.

For the most difficult tasks, expression by example does not provide all necessary information, so prior understanding must be encoded through transfer learning or by modifying the loss function. In these cases, the computer is being told to fill in the gaps in specification of the problem as well as the solution -- learning what is missing in the examples, and taking instruction from the implied in addition to the explicit.

Refinforcement learning is still a blunt and inefficient instrument. It's very hard to get anything to work, even with extensive hyperparameter tuning and wide searches through program space. The promise of meta-refinforcement-learning is that reinforcement learning will become reliable and even easy for a practicioner. Though I suspect this will require a solid calculus of reward functions, especially covering implicit reward.

Early in computing the first compilers could take an abstract representation of human instructions and convert them to executable code. Compiler bugs were common and the languages at hand were clunky and inexpressive. In the future it appears that meta-RL algorithms may improve as compilers did, but there has been minimal progress in improving the expressibility of our tool for expression, the reward function.

Classic reward functions are one-dimensional scalar values. As a language, these have even greater problems with expressibility than early program languages. Some progress is being made in [how to define what we meant, not what we said](https://intelligence.org/files/ValueLearningProblem.pdf) using examples that indrectly describe a reward function, but the problem looks to require a new language altogether.

It's a comparatively easy task to design a language for "copy value X to register A" with hard logic, it's much harder to design a language for "rescue all the people but don't break any laws" that has any logical consitency.

