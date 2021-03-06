---
layout: post
title:  "Lords Ipsum - GPT-2 Hansard"
---

Following all the drama surrounding Brexit I've taken to following live broadcast debates from the houses at Westminster.
Having [seen what GPT-2 can do][transformer] I wondered if it could be made to reproduce the distinctive style of rhetoric used in the House&nbsp;of&nbsp;Lords.

It can! Well, to a point. It's more reminiscient of [Yes Minister] in some results, and simply surreal in others.
Generating text using the "medium" GPT-2 feels enough like playing with fire that I can understand why the [full version is still under wraps][fullversion], [even following independent reproduction][lesswrong].

### Disclaimer stuff

I've deliberately removed quote attribution from the training data, as I wanted to avoid generating quotes misattributable to real people.
The generated text is an unsupervised and fictional account, any attribution or implied claims are unintentional.
The ideas and autogenerated fiction are provided as-is and without warranty, generated content provided under the CC license.
Cool your litigious jets, I do not claim any of this as true or even indicative of the source record in general.
May the noble and most ancient House of Lords continue to serve unswervingly, with impeccable diction and fortitudinous formalism.

### Some convincing hot garbage

The algorithm temperature here is set at 1, so the generated text is otherwise more random and spicy than that at 0.7.
Here are a few hand-picked extracts:

> My Lords, I hope that the Minister will accept my words as either "extremely", "potential" or "very much"". The disease is so terrible within the NHS that it is a shambles. The youngsters in the area are incredibly scared of their health and they do not know whether they are young or fully healthy.

> My Lords, I am not sure what is meant by the words "never have had soft drinks too salty". I suspect that there is some possibility that these could not be beneficial, and therefore artificially sweetened.

> I am delighted that this Bill has come in so soon after the mental hospital ban was introduced.

> I see, I withdraw now. Unless I get a letter from my noble friend saying that I am allowed to resume the whole business, I shall be glad to withdraw the Amendment.

> My Lords, can I stand back for a moment and say that I do not agree that inappropriate engineering causes local problems. But it did affect Cornwall, I guess.

> I belong to the noble Lord, Lord Ezra; the motion has the support of my noble friend Lord Barnett, and I should quite like consent to withdraw the amendment.

> My Lords, I can give a figure of £400 million a year for forest research. I think I would add that not only is that money recyclable but it is also potentially biomass claimable income, which is greatly to propel the large forestry corporations into full scale production.

> No, actually not!

> I am sorry; I misunderstood. I shall get it correct. I do not know whether he used the words, "subordinate factors in a hospital discharge arrangement". I wonder whether it was not as simple as that.

> However, they are not commuters, they are cosmic lizards to some extent, I think, and we are bound to recognise that, making use of every little computational and experimentalr substance that we have to use to come up with any money for the island and to allow the project to run go through.

> I wonder whether I am sufficiently clear in my mind. I entirely understand a proposition to be conveyed to a fish enthusiast but not the garbage collector, as the proposal turns out.

> My Lords, before the noble Lord sits down, inter alia, he is misinformed. The Report referred to Poland!

> I put my concerns to the Minister, but he has said that litigation can not go ahead. If that is his statement, I am greatly relieved.

> My Lords, I am most grateful for that. If I may say so, I do not mind the request that but earlier, so far as I can remember, I never asked it. I am grateful, but I was never asked since my response to question 1 on the last occasion was equally shortbirdy.

> My Lords, I believe that we are in a royal expedition to get the ghosts of the past out of your room, somehow.

> My Lords, has the noble Lord overlooked the "servant of the People" heading that turns the gross price for chunky limited stock into net?

> My Lords, does not my noble friend mean solely on economic grounds, as he referred to the increased number of pedestrians?

### Interesting...

> My Lords, I wonder whether the Leader of the House can help me in the matter especially after that very acceptable Declaration of real humanity.

> That is a bitter pill to swallow.

> I am grateful for that clarification. I am not sure whether the word "correct" is intended as a noun or as an adjective. I shall be glad to be reassured by the noble Lord, Lord Richard.

> My Lords, I am grateful to the noble Lord, Lord Street, for introducing this critical debate. The debate is also timely, as it is the year of the World Cup. For many years this House has been involved in matters of international football, and in international sport. It is timely because during the past 20 years the sport which I know best of all is cricket. I leave it to the noble Lord to make his case, and I shall not bore the House by referring to the merits or otherwise of the debate. I shall, however, say a few words about international football. The debate will be about the best way of developing international cricket in a manner which is acceptable in the countries of the world. The noble Lord, Lord Street, mentioned in opening that, "the sport is different only in that it develops on its own frontier". That is not a new idea; it is something which was developed by the early nineteenth century. We have only to look at the Middle Ages to see that that was the case. I am sure that in the next century we shall have developed the same idea that the development of international cricket is a matter for the developing countries themselves. The idea is that that is the way in which cricket should develop. It is not a matter for the developing countries, but it is a matter for the developing countries, and they have developed the idea that they should develop cricket, so that they have a fair chance of going out on the winning side, with a few points deducted from the top of the bowling bowlers' list. Of course, if they do not do it, they are not going to win the game.

> I shared the view expressed by the noble Lord, Lord Malkov, that it was extremely ridiculous, especially to have the Bill now moving an altogether changed life and there would be no answer, in fact, which would work in practice. But this is because, as I say, the argument is always absolutely unacceptable. In particular, the argument seems to be: why ought it make sense? It did not on multitudinous occasions many years ago, but now it has become unacceptable. It has to be looked at again, but I am concerned that it is one which does not quite work at the moment.

### Finally

> My Lords, before my noble friend leaves that point I must say that of course there is a distinction—it can even be seen—between modernity and mechanical revolution. Atomic energy is nigh on timeless. If he reads to-day's editions of Hansard he will find no heart on it being hard to understand. I should rather like to read to him the word "machine."

I've made files available containing 1k generated extracts:

- [temperature 0.7](/files/gen_070.txt)
- [temperature 1.0](/files/gen_100.txt)

Here I have taken an excellent dataset and plugged it into an excellent model.
All magic is due to the wizards on the GPT-2 team at OpenAI (Alec Radford, Jeffrey Wu, Rewon Child, David Luan, Dario Amodei, Ilya Sutskever), [Neil Shepperd] for the model finetuning and [Max Woolf] for making it simple.
Thank you to the dedicated public servants responsible for the dataset.

[transformer]: https://talktotransformer.com
[Yes Minister]: https://en.wikipedia.org/wiki/Yes_Minister
[fullversion]: https://openai.com/blog/gpt-2-6-month-follow-up/
[lesswrong]: https://www.lesswrong.com/posts/36fxiKdEqswkedHyG/the-hacker-learns-to-trust-1
[Neil Shepperd]: https://github.com/nshepperd
[Max Woolf]: https://github.com/minimaxir

