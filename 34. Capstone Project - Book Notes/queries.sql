-- Create the books table --
-- CREATE TABLE books (
    -- id SERIAL PRIMARY KEY,              -- Unique identifier for each book --
    -- title VARCHAR(255) NOT NULL,        -- Title of the book --
    -- author VARCHAR(255) NOT NULL,       -- Author of the book --
    -- publication_year INTEGER,           -- Year the book was published --
    -- genre VARCHAR(100),                 -- Genre of the book --
    -- isbn VARCHAR(20) UNIQUE,            -- ISBN number, unique for each book --
    -- short_description VARCHAR(500),     -- A short summary or description of the book --
    -- long_description TEXT,              -- A detailed description of the book --
    -- publisher VARCHAR(255),             -- Publisher of the book --
    -- page_count INTEGER,                 -- Number of pages in the book --
    -- language VARCHAR(50),               -- Language in which the book is written --
    -- cover_image_url VARCHAR(255),       -- URL to the cover image of the book --
    -- created_at TIMESTAMP DEFAULT NOW(), -- Timestamp for when the book record was created --
    -- updated_at TIMESTAMP DEFAULT NOW()  -- Timestamp for when the book record was last updated --
-- );

CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    publication_year INTEGER,
	rating DECIMAL(3, 1),
    isbn VARCHAR(20) UNIQUE,
    description VARCHAR(500),
    review TEXT
);

-- Inserting multi-paragraph description and review into the books table --
INSERT INTO books (title, author, publication_year, rating, isbn, description, review)
VALUES (
    'Rich Dad Poor Dad',
    'Robert T. Kiyosaki',
    1997,
	3,
    '9781612680194',
    $$"Rich Dad Poor Dad" by Robert T. Kiyosaki contrasts the financial philosophies of his two "dads" – his biological father (poor dad) who followed traditional employment and saving, and his best friend’s father (rich dad) who built wealth through investing and entrepreneurship. The book advocates for financial literacy, acquiring assets over liabilities, and developing multiple income streams to achieve financial independence.$$, 
    -- $$'"Rich Dad Poor Dad" by Robert T. Kiyosaki is a seminal work in the personal finance genre that has captivated readers with its engaging narrative and accessible exploration of wealth-building principles. The book juxtaposes the financial philosophies of two influential figures in Kiyosaki’s life: his biological father, the "poor dad", who adhered to conventional wisdom of hard work and saving, and his best friend’s father, the "rich dad", who believed in financial education, investing, and making money work for you. Through these contrasting viewpoints, Kiyosaki challenges traditional notions about employment, savings, and the path to financial security.' || chr(10) || chr(10) || 'One of the book’s greatest strengths is its ability to simplify complex financial concepts, making them approachable for a broad audience. Kiyosaki’s use of relatable stories and clear examples demystifies ideas like assets, liabilities, and the importance of financial literacy, encouraging readers to think beyond the typical paycheck-to-paycheck lifestyle. His central message—that wealth can be achieved by acquiring assets and pursuing financial independence—resonates powerfully, empowering many to reconsider their financial strategies and take control of their economic futures.' || chr(10) || chr(10) || 'However, the book is not without its criticisms. Some argue that its advice can be overly simplistic and broad, lacking the detailed, actionable steps necessary for practical application. Kiyosaki’s personal anecdotes about real estate and entrepreneurship, while inspirational, may not be easily replicable for every reader, particularly those without significant resources or a high tolerance for risk. Additionally, the book’s critique of traditional employment overlooks the stability and benefits that many people rely on and might not account for the diverse circumstances individuals face.' || chr(10) || chr(10) || 'Despite these critiques, "Rich Dad Poor Dad" remains a pivotal work that has inspired millions to seek out financial education and consider new ways of building wealth. For those new to the concepts of personal finance, the book serves as a valuable starting point, though it is advisable to supplement its insights with more detailed resources or professional advice. Overall, Kiyosaki’s ability to provoke thought and inspire action in the realm of financial independence is a testament to the enduring impact of his work.'$$
    $$"Rich Dad Poor Dad" by Robert T. Kiyosaki is a seminal work in the personal finance genre that has captivated readers with its engaging narrative and accessible exploration of wealth-building principles. The book juxtaposes the financial philosophies of two influential figures in Kiyosaki’s life: his biological father, the "poor dad", who adhered to conventional wisdom of hard work and saving, and his best friend’s father, the "rich dad", who believed in financial education, investing, and making money work for you. Through these contrasting viewpoints, Kiyosaki challenges traditional notions about employment, savings, and the path to financial security.
	
	One of the book’s greatest strengths is its ability to simplify complex financial concepts, making them approachable for a broad audience. Kiyosaki’s use of relatable stories and clear examples demystifies ideas like assets, liabilities, and the importance of financial literacy, encouraging readers to think beyond the typical paycheck-to-paycheck lifestyle. His central message—that wealth can be achieved by acquiring assets and pursuing financial independence—resonates powerfully, empowering many to reconsider their financial strategies and take control of their economic futures.
	
	However, the book is not without its criticisms. Some argue that its advice can be overly simplistic and broad, lacking the detailed, actionable steps necessary for practical application. Kiyosaki’s personal anecdotes about real estate and entrepreneurship, while inspirational, may not be easily replicable for every reader, particularly those without significant resources or a high tolerance for risk. Additionally, the book’s critique of traditional employment overlooks the stability and benefits that many people rely on and might not account for the diverse circumstances individuals face.
	
	Despite these critiques, "Rich Dad Poor Dad" remains a pivotal work that has inspired millions to seek out financial education and consider new ways of building wealth. For those new to the concepts of personal finance, the book serves as a valuable starting point, though it is advisable to supplement its insights with more detailed resources or professional advice. Overall, Kiyosaki’s ability to provoke thought and inspire action in the realm of financial independence is a testament to the enduring impact of his work.$$
), (
    'Think and Grow Rich', 
    'Napoleon Hill', 
    1937,
	3.5,
    '9781937879501', 
    $$"Think and Grow Rich" by Napoleon Hill distills the strategies of successful individuals into 13 principles for achieving personal and financial success. Based on Hill’s study of prominent figures like Andrew Carnegie and Henry Ford, the book emphasizes the power of thought, faith, desire, and persistence. It provides a blueprint for transforming ambition into tangible wealth and success through focused mindset and disciplined actions.$$,
	$$"Think and Grow Rich" by Napoleon Hill is a cornerstone of self-help literature, acclaimed for its profound insights into personal and financial success. Written in 1937, the book synthesizes Hill’s extensive study of over 500 successful people, including luminaries like Andrew Carnegie, Thomas Edison, and Henry Ford, into a blueprint for achieving wealth and prosperity. Hill’s core thesis is that success begins with a definitive purpose and a burning desire, and he presents 13 principles, ranging from goal-setting and visualization to persistence and organized planning, to help readers harness the power of their thoughts and translate them into real-world accomplishments.
	
	One of the book’s major strengths is its timeless emphasis on mindset. Hill’s assertion that "thoughts are things" has resonated across generations, encouraging readers to cultivate a positive and determined mental attitude as the foundation for success. His principles, such as the importance of specialized knowledge, the power of the mastermind group, and the necessity of overcoming fear, offer valuable insights that are applicable in various personal and professional contexts.
	
	However, "Think and Grow Rich" is not without its drawbacks. Some modern readers might find its focus on the metaphysical aspects of success—like the law of attraction and the power of auto-suggestion—less tangible and more abstract compared to contemporary goal-setting or productivity methodologies. Additionally, the book reflects the era in which it was written, with occasional archaic language and outdated views, particularly in its examples and gender roles.
	
	Despite these criticisms, Hill’s work remains a significant influence in the realm of personal development. Its emphasis on self-belief, goal clarity, and relentless pursuit of one’s ambitions continues to inspire millions. For those willing to embrace its philosophical approach and delve into its rich, albeit sometimes dated, content, "Think and Grow Rich" offers a profound roadmap to achieving personal and financial success. To maximize its benefits, readers may find it helpful to pair its insights with practical strategies from more contemporary resources.$$
), (
    'Sapiens: A Brief History of Humankind',
    'Yuval Noah Harari',
    2014,
	4.5,
    '9780062316097',
    $$"Sapiens: A Brief History of Humankind" by Yuval Noah Harari explores the evolution of Homo sapiens from ancient hunter-gatherers to modern societies. Harari examines the impact of the Cognitive, Agricultural, and Scientific Revolutions on human history and culture. The book offers a broad narrative that delves into humanity’s influence on the world and contemplates our future in a complex, interconnected global society.$$,
    $$"Sapiens: A Brief History of Humankind" by Yuval Noah Harari is an expansive and enlightening journey through the vast landscape of human history. Tracing the development of Homo sapiens from their origins in Africa to the intricacies of contemporary civilisation, Harari combines insights from anthropology, biology, history, and economics into a coherent and compelling narrative. He structures the book around three major revolutions—the Cognitive, Agricultural, and Scientific—that have profoundly shaped the course of human history.
	
	One of the book’s strengths is Harari’s ability to synthesise complex ideas from diverse academic disciplines into an accessible and engaging story. His discussion on the Cognitive Revolution highlights how our capacity for abstract thought and communication set the stage for cultural and technological advancements. Harari’s exploration of the Agricultural and Scientific Revolutions is equally insightful, showing how these shifts have redefined human societies, economies, and even our biology.
	
	Harari’s narrative is enriched by his ability to connect past human endeavours with future aspirations, providing a broad context that helps readers understand the magnitude of the changes we face today. His engaging writing style makes these complex ideas accessible to a wide audience, encouraging thoughtful reflection on our historical journey and future challenges.
	
	However, Harari’s broad approach has attracted some criticism. Critics argue that the sweeping generalisations in the book can sometimes oversimplify the complexities and nuances of human history. Additionally, his speculative ideas about the future, while provocative, may seem more like science fiction than grounded predictions to some readers.
	
	Moreover, Harari’s critical perspective on human progress, particularly regarding the negative consequences of agricultural and industrial developments, might come across as overly pessimistic. His focus on the unintended consequences of these revolutions—such as inequality, environmental degradation, and psychological stress—provides a counterpoint to more triumphant narratives but may leave some readers wanting a more balanced view of human achievements.
	
	Despite these critiques, "Sapiens" remains a significant work that challenges readers to think deeply about the forces that have shaped our past and consider the profound implications for our future. For those seeking a broad, interdisciplinary perspective on human history, Harari’s book offers a rich and engaging narrative. To delve deeper into specific aspects of our evolution and history, readers might find it beneficial to explore additional specialised resources alongside "Sapiens".$$
), (
    '21 Lessons for the 21st Century',
    'Yuval Noah Harari',
    2018,
	4,
    '9780525512172',
    $$"21 Lessons for the 21st Century" by Yuval Noah Harari examines the critical issues and challenges of the modern world. Harari explores themes such as technology, politics, climate change, and the nature of truth, providing insights into how these forces shape our present and future. The book encourages readers to develop clarity, resilience, and adaptability in navigating the complexities of the 21st century.$$,
    $$"21 Lessons for the 21st Century" by Yuval Noah Harari is a compelling exploration of the pressing issues that define our contemporary world. Building on the historical insights of "Sapiens" and the future-oriented speculations of "Homo Deus", Harari shifts his focus to the present, addressing the most urgent questions facing humanity today. The book is structured into 21 chapters, each tackling a significant theme such as artificial intelligence, nationalism, religion, and climate change.
	
	Harari excels in distilling complex topics into engaging and accessible narratives, making profound subjects understandable to a broad audience. He offers a sweeping perspective that connects historical context with current trends, helping readers grasp how past developments influence present challenges. His insights into technology, particularly the impacts of artificial intelligence and automation on employment and society, are both timely and thought-provoking.
	
	One of the book’s strengths is Harari’s ability to provoke thoughtful discussion by posing challenging questions rather than offering definitive answers. He encourages readers to critically engage with the material and reflect on their own perspectives and beliefs. This approach fosters deeper understanding and personal reflection, making the book a valuable resource for anyone seeking to navigate the complexities of the modern world.
	
	Harari’s examination of the interplay between globalisation and nationalism, and his reflections on the role of religion and culture in shaping human societies, provide a rich context for understanding current geopolitical dynamics. His discussions on the nature of truth in the age of information and the challenges of fake news are particularly relevant, offering insights into how we might discern reality in a digitally interconnected world.
	
	However, the breadth of topics covered in "21 Lessons for the 21st Century" means that some subjects are treated more superficially than they might be in more specialised works. Readers looking for in-depth analysis on specific issues may find the book’s approach somewhat broad. Additionally, Harari’s sometimes cautionary or even pessimistic tone regarding the future implications of technological and societal changes might not resonate with those seeking more optimistic or actionable solutions.
	
	Moreover, while Harari’s global outlook is a strength, it can also be seen as a limitation. His analysis, while broad and insightful, might not fully account for the nuanced realities and diverse experiences across different cultures and socioeconomic contexts. This can lead to generalisations that may not capture the full complexity of issues faced worldwide.
	
	Despite these critiques, "21 Lessons for the 21st Century" is a valuable and engaging read that offers important insights into the most significant issues of our time. Harari’s ability to synthesize diverse fields of knowledge and his call for clarity, resilience, and adaptability in facing future challenges make this book a compelling guide for understanding and navigating the 21st century. For readers seeking to deepen their understanding of specific topics, it may be beneficial to supplement Harari’s broad overview with more focused resources.$$
), (
    'Homo Deus: A Brief History of Tomorrow',
    'Yuval Noah Harari',
    2016,
	5,
    '9780062464316',
    $$"Homo Deus: A Brief History of Tomorrow" by Yuval Noah Harari explores the potential future of humanity as it confronts advanced technology, artificial intelligence, and biotechnological innovations. Harari considers how these advancements could transform human life and possibly lead to the emergence of a new species, "Homo Deus." The book discusses the ethical and existential challenges of pursuing immortality, happiness, and god-like powers.$$,
    $$"Homo Deus: A Brief History of Tomorrow" by Yuval Noah Harari presents a thought-provoking exploration of the future of humanity, building upon the historical insights provided in "Sapiens". Harari investigates how current technological and scientific advancements might shape our destiny, potentially leading to an era where humans transcend their biological limits and become "Homo Deus"—god-like beings with unprecedented capabilities.
	
	Harari begins by examining humanity’s historical quest for power and control, suggesting that our focus has shifted from survival to seeking immortality, happiness, and ultimate control over our environment and biology. He explores how advances in artificial intelligence, biotechnology, and data science could enhance human capacities, cure diseases, and even alter the essence of human nature.
	
	A key strength of "Homo Deus" is Harari’s ability to pose challenging and speculative questions about the implications of these advancements. He prompts readers to consider the ethical and societal consequences of technologies that could extend life, create artificial intelligence, and possibly lead to significant inequalities or new forms of consciousness. His insights into how AI and bioengineering could fundamentally transform what it means to be human are both intriguing and unsettling.
	
	Harari’s narrative is enriched by his ability to link these futuristic possibilities to deep historical and philosophical insights. He draws connections between past human endeavours and future aspirations, offering a broad context that helps readers grasp the magnitude of the changes we might face. His engaging writing style makes complex and speculative ideas accessible to a broad audience, encouraging thoughtful reflection on the paths we might take.
	
	However, "Homo Deus" has faced some criticism for its speculative nature. Critics argue that while the book offers thought-provoking scenarios, it sometimes ventures into areas that may seem more like science fiction than grounded in reality. The bold predictions regarding AI and bioengineering, although imaginative, may lack practical feasibility in the near term.
	
	Additionally, Harari’s focus on potential dystopian outcomes, such as the rise of digital dictatorships or ethical dilemmas posed by advanced technologies, might be perceived as overly pessimistic by some readers. While these scenarios are valuable for sparking discussion, they may not fully capture the potential positive impacts of technological progress.
	
	Despite these critiques, "Homo Deus" remains an important contribution to the discourse on the future of humanity. It challenges readers to think deeply about the direction of technological and societal evolution and the profound changes that lie ahead. For those interested in exploring the intersection of history, technology, and human potential, Harari’s work offers a compelling and thought-provoking narrative. To gain a balanced understanding, readers might benefit from examining additional perspectives on the ethical and practical implications of these emerging technologies.$$
), (
    'How to Win Friends and Influence People',
    'Dale Carnegie',
    1936,
	2,
    '9780671027032',
	$$"How to Win Friends and Influence People" by Dale Carnegie is a classic guide on enhancing interpersonal communication and building strong relationships. Carnegie outlines principles for making others feel valued, resolving conflicts gracefully, and inspiring cooperation. Through practical advice and examples, the book teaches readers how to cultivate positive relationships and effectively influence others in both personal and professional contexts.$$,
	$$"How to Win Friends and Influence People" by Dale Carnegie, first published in 1936, remains a seminal work in the field of self-help and personal development. Its enduring success is a testament to Carnegie’s timeless advice on improving interpersonal skills and mastering the art of influence. The book is structured around key principles designed to help individuals enhance their communication and build positive, productive relationships.
	
	Carnegie’s insights into human behaviour are remarkably accessible and applicable across various facets of life. His advice centres on the importance of genuinely valuing others, listening attentively, and expressing appreciation. By advocating behaviours such as avoiding criticism, offering sincere praise, and understanding other’s perspectives, Carnegie provides practical tools for navigating social interactions and building lasting rapport.
	
	One of the book’s major strengths is its use of real-life examples and anecdotes to illustrate its principles. Drawing from a diverse range of experiences, from historical figures to everyday encounters, Carnegie makes his advice relatable and actionable. This approach not only grounds his concepts in practical reality but also helps readers remember and apply them in their daily lives.
	
	However, "How to Win Friends and Influence People" has faced some criticism over time. Some modern readers might find the language and examples somewhat dated, reflecting the era in which the book was written. Additionally, while the principles are fundamentally sound, they may appear overly simplistic or formulaic to some. In today’s complex and diverse social landscape, these strategies might require adaptation or supplementation with more nuanced approaches to communication.
	
	Moreover, some critics argue that the focus on influencing others could be perceived as manipulative if not applied with genuine intent and ethical consideration. Although Carnegie emphasises the importance of building goodwill and mutual benefit, it is crucial for readers to balance the pursuit of influence with authenticity and respect for other’s autonomy.
	
	Despite these critiques, "How to Win Friends and Influence People" continues to be a valuable resource for anyone looking to improve their interpersonal skills and build more meaningful relationships. Its principles, when applied sincerely and ethically, offer timeless strategies for fostering cooperation and understanding. For those seeking to enhance their ability to connect with others, Carnegie’s book serves as an excellent foundation, though it may be beneficial to complement its teachings with insights from contemporary social and psychological research to navigate today’s diverse interpersonal landscapes effectively.$$
), (
    'Atomic Habits: An Easy & Proven Way to Build Good Habits & Break Bad Ones',
    'James Clear',
    2018,
	4.7,
    '9781847941831',
	$$"Atomic Habits" by James Clear is a guide to forming beneficial habits and breaking detrimental ones. Clear explains how small, incremental changes, or "atomic habits," can lead to significant improvements over time. By focusing on identity, processes, and environment, the book offers practical strategies to make positive behavioural changes and achieve lasting success.$$,
	$$"Atomic Habits" by James Clear is an insightful and practical guide on the transformative power of small, consistent changes in our daily lives. Clear argues that the key to achieving substantial success lies in the accumulation of tiny, incremental actions—what he calls "atomic habits." These small adjustments, he suggests, can compound over time to produce remarkable and lasting improvements.
	
	Clear’s writing is engaging and accessible, making complex behavioural science concepts easy to understand and apply. He begins by emphasising that habits are the compound interest of self-improvement. Just as minor financial deposits accumulate over time to yield significant returns, tiny behavioural changes can accumulate to bring about significant outcomes in personal and professional arenas.
	
	A central theme of the book is the focus on identity-based habits. Clear underscores the importance of aligning habits with one’s desired identity rather than merely focusing on specific goals. For instance, rather than setting a goal to read more books, one should aim to become a reader. This shift from outcome-based goals to identity-based habits fosters a deeper and more enduring commitment to change.
	
	Clear also explores the mechanics of habit formation, breaking down the process into four stages: cue, craving, response, and reward. He offers practical strategies for each stage, enabling readers to build positive habits and break negative ones effectively. His "Four Laws of Behaviour Change"—Make it obvious, Make it attractive, Make it easy, and Make it satisfying—serve as actionable guidelines for establishing habits.
	
	One of the book’s strengths is its emphasis on the environment and context in shaping behaviours. Clear suggests that by designing our surroundings to support desired habits, we can facilitate positive changes more effortlessly. This perspective encourages readers to consider how their physical and social environments can be optimised to support better habits.
	
	The book is replete with real-world examples and anecdotes that illustrate Clear’s principles in action. These stories from various fields, including sports, business, and personal development, provide concrete evidence of how small changes can lead to significant successes. They also make the theoretical concepts more relatable and inspiring for readers.
	
	However, some critics argue that "Atomic Habits" may oversimplify the complexities of human behaviour and habit formation. While the strategies Clear outlines are practical and effective, individual differences in personality, motivation, and life circumstances mean that habit formation is not equally straightforward for everyone. Additionally, the book’s focus on incremental improvements might not fully address the needs of those seeking more immediate or drastic change.
	
	Moreover, readers looking for a more scientific or academic exploration of habits might find Clear’s approach somewhat lacking in deep psychological or neurological insights. The book is geared more towards practical application than theoretical depth, which can be both a strength and a limitation depending on the reader’s expectations.
	
	Despite these critiques, "Atomic Habits" remains a valuable resource for anyone looking to make positive changes in their life. Clear’s emphasis on the power of small, consistent actions and his practical, step-by-step approach to habit formation provide readers with a useful framework for achieving long-term success. For those who wish to build better habits and eliminate unproductive ones, "Atomic Habits" offers a clear and effective roadmap, making it a worthwhile addition to the self-help and personal development genre.$$
);

SELECT * FROM books;
-- Write this in description and review data types using double dollar quoted string so that it shows like this in my webpage. ’ 