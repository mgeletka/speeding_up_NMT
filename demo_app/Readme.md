
# Demo application
This part of the repository implenets the demo application developed to demonstrate trained models in my Master Thesis.
The Demo application is currently deployed on:https://demo-nmt-app.artin.cz/


## Parts of the Demo application
* Python server -- exposes Flask REST API for usages of trained models using Fairseq library, the server has three different Rest Endpoints for translation, paraphrasing, and spell-correction
* Node.js server -- serves as a mediator between Python backend and Vue.js frontend. Furthermore, it serves the built javascript frontend on a given route
* Vue.js frontend -- serves as a web interface for the user (in detail description in the Subsection~\ref{subsection:user-interface})


All three parts are dockerized and therefore easily deployed on any server. The application is currently deployed on the internal server of company Artin spol s r. o. and tunneled to the public network.

## User interface
* Home  -- the Home page serves both as landing page and menu for navigation for individual NMT services 
* Translate  -- the site offers translation from English to Czech. The user can choose the inference hyper-parameters such as beam size and max iteration and selected desired model(
* Paraphrase generation  -- the site offers a paraphrase service. The user can choose the input language (Czech or English) and also the number of candidates translations to be translated in pivot language and back
* Spell-Correction -- the site offers a spell-correction service. The user can input corrupted text, and the site generates clean-up text, but currently works only in the Czech language
