## 1. Make View
- List 사용
- Custom View 사용 (1. struct 2. computed property)
- Custom Modifier 사용 (1. struct 2. extension View method)


## 2. Data Flow
- `@State` (Source of Truth)
- `@Binding` (Derived Value)
- UI와 Data의 의존 관계 이해


## 3. Transition
- `.sheet` / `.fullScreenCover` 화면 전환
- NavigationView & NavigationStack - NavigationLink 화면 전환


## 4. AsyncImage
- AsyncImage -> 이미지 로딩중 or 실패 시 예외처리
- ScrollView + LazyVStack -> 뷰에 보이는 이미지만 로딩
- AsyncImageView frame의 필요성 -> 이미지 과호출 방지
- Vertical Scroll + Horizontal Scroll practice


## 5. Grid
- ScrollView + LazyVGrid
- GridItem layout 방식
- Binding -> `.constant()`


## 6. Search
- `.searchable` + `.onSubmit(of: .search)`
- toolbar + toolbarItemGroup

## 7. View init & body rendering 테스트
- Custom View 생성 (1. struct  2. property  3. method)
- struct로 생성한 View를 사용할 때,
  - struct 내부의 데이터가 변하면 init, body 모두 재호출
  - 내부 데이터의 변화가 없으면 init은 재호출, but body는 재호춡x
  - 즉, 두 인스턴스의 차이가 없다고 판단하면 body를 새롭게 그리지 않는다.
- 매번 새로 호출되는 init 내부에 네트워크 통신처럼 리소스가 많이 발생하는 코드 적지 않도록 주의