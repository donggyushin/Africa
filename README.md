# Africa

iOS best practice project. 모듈화, 클린아키텍쳐 도입.

# Screens

<div>
<img src="https://github.com/user-attachments/assets/b392e35f-5c6c-4628-b61d-2999c04c137b" width=150 />
<img src="https://github.com/user-attachments/assets/ccab13bc-856e-45f5-b8b0-15256de30f3a" width=150 />
<img src="https://github.com/user-attachments/assets/97024281-5b0a-4acf-9cc1-043e903020cc" width=150 />
<img src="https://github.com/user-attachments/assets/deb95678-3176-48de-b04d-5bd3d853a32e" width=150 />
<img src="https://github.com/user-attachments/assets/303fb6db-391b-44d1-aded-f8f2d90cd213" width=150 />
<img src="https://github.com/user-attachments/assets/43575ae2-1034-4d8f-9e63-15370fa3c0cc" width=150 />
<img src="https://github.com/user-attachments/assets/96e34699-b637-4b55-9518-f65f7cb87de6" width=150 />
</div>

# Tech

- SwiftUI
- MapKit
- Sticker Pack
- AVKit
- DI(Swinject)

# Architecture

<img src="https://github.com/user-attachments/assets/8c19a58e-0c86-4d5f-a72b-e705418eb8aa" />

**모듈화**

비슷한 책임을 갖는 코드끼리 묶어 모듈로 나누었습니다.
모듈화를 해서 모듈끼리의 의존 관계를 설정하고, 코드의 결합도를 낮추고, 응집도를 높입니다. 이로 인해 프로젝트의 유지 보수성이 좋아집니다.
모듈 별로 책임이 다르기 때문에 다른 사람이 봤을 때 이런 코드가 이런 모듈 안에 들어갈 것 같다고 예측을 할 수 있습니다. 코드 가독성과 개발 효율이 높아집니다.
의존성 없이 잘 만들어 놓은 모듈은 다른 프로젝트에서도 재활용할 수 있습니다.

**클린 아키텍처**

- Data Layer : 백엔드 or 로컬 데이터로부터 데이터를 가져오는 책임을 갖습니다. Repository 를 갖습니다.
- Domain Layer : 앱의 비즈니스 로직을 담당합니다. UseCase, VO (Value Object), Repository Protocol 을 갖습니다.
- Presentaion Layer : UI 로직 관련 책임을 갖습니다. MVVM 패턴을 활용했습니다.

**코디네이터 패턴 (Coordinator)**

화면 전환을 담당하는 객체입니다.
화면간 의존성을 줄이고 화면 이동을 할 수 있게 돕습니다.
코디네이터는 자식 코디네이터를 가질 수 있습니다. 코디네이터를 활용하면 모듈간 의존성 없이 화면 이동이 가능합니다. <br />

**Deep Link**

Scheme URL 과 Coordinator 패턴을 융합하여 앱의 외부에서도 앱의 화면 상태를 쉽게 조작 할 수 있게 작업하고, 서로 다른 화면들끼리도 의존성 없이 전환 가능하도록 작업하였습니다.

```
ex) browse tap 에서 id 가 lion인 데이터의 상세 화면으로 이동
dgafrica://browse?screen=detail&id=lion
```

**PreviewData**

Xcode 의 Preview 기능을 수월하게 사용하기 위하여 Preview 를 꾸리기 위한 데이터셋을 모듈로 분리하여 관리.
