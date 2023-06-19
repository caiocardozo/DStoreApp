# DStoreApp iOS
DStore app é um app de loja(Store) que recebe uma lista de spotlights, produtos e um cash do back end.


### Check list

- [x] Arquietura MVVM 
- [x] ViewCode
- [x] Swift
- [x] Libs (CocoaPods)
- [x] Layout basedo no exemplo fornecido
- [x] Guideline Human Interface
- [x] Alamofire
- [x] Teste unitário
- [x] Localizable Strings

### Arquitetura MVVM
Foi utilizada a arquitetura MVVM por entender que é uma arquitetura de facil entendimento, rápido desenvolvimento, além de proporcionar uma boa estuturação do código e que atende o desafio imposto. 

### ViewCode
Projeto inteiramente feito em ViewCode

### Libs
Para o projeto algumas libs foram escolhidas:
- SnapKit: Escolhida para agilizar o desenvolvimento, tornar o código mais limpo e claro.
- Alamofire: Escolhido por ser a lib que tenho conhecimento e que mais utilizo. Fiz um rápido estudo para tentar trocar a camada de rede para usar URLSession, porém foi constatado a troca inviavél, devido ao fator de ter que estudar a lib para implantar e versao de deployment ser iOS 12. Isso atrasaria a entrega, ficando asim para uma release futura. 
- SDWebImage: Lib usada para carregamento das imagens, foi escolhida por oferecer uma funcionalidade boa e agilizar o desenvolviento por ja ser algo pronto. 

### Testes unitários
Os testes unitários foram feitos para testar algumas funções principais do app, como:
- Decodificar os objetos de backend
- Instancias as principais controllers Home e Detail

### Localizable Strings
Foi inserido o localizable de strings no app, não para ter uma lingua no app que não é o requisito no momento, mas afim de centralizar as strings.

## Como executar o projeto 
- Na raiz executar comando pod install para instalar os pods necessários.
- Abrir o projeto executando xed .

### TODO
- Implmentar o uso do SwiftLint no projeto, afim de padronizar e melhorar a escrita de código. 
- Trocar a camada de network para usar swift nativo e assim remover o pod Alamofire
- Efetuar o carregamento das imagens de forma nativa e assim remover o pod SDWebImage
- Implementar o uso de targets no app.