# LearningLog

## Week 01 - Haftalık Özet

### Bu hafta ürettiğim şey

SwiftUI ile geliştirdiğim, harcamaları ekleyebildiğim, kategorilere göre filtreleyebildiğim, toplam harcamayı görebildiğim ve kayıtları silebildiğim bir iOS Expense Tracker uygulaması.

- Commit sayısı: 29 (bu özetin commit'i hariç, o sonradan atılacak)
- Başlıca dosyalar: `ContentView.swift`, `AddExpenseView.swift`, `Expense.swift`, `Category.swift`,
- `ExpenseStorage.swift`, `ExpenseRow.swift`, `TotalSummaryView.swift`, `Date+Sample.swift`
- Diğer çıktılar: `README.md`, `TestScenarios.md`, `gaps.md`
- Önemli özellik: Harcamaların `UserDefaults` üzerinden kalıcı olarak saklanması

### Öğrendiğim 3 şey

- **Data flow ve closure'lar:**
Bir view'in başka bir view tarafından oluşturulan veriyi nasıl alabildiğini anladım.
`onSave` closure sayesinde `AddExpenseView`, harcamayı doğrudan kaydetmek yerine oluşturduğu veriyi `ContentView`'e iletiyor. Böylece sorumlulukların nasıl ayrıldığını kavradım.

- **Decimal ve sayı hassasiyeti:**
Para işlemlerinde neden `Double` yerine `Decimal` kullanmam gerektiğini, yuvarlamanın kullanıcının girdiği gerçek değeri nasıl değiştirebileceğini öğrendim.
İki ondalık basamak kontrolü yaparak hatalı değerlerin sessizce kabul edilmesini engellemeyi anladım.

- **Calendar, DateComponents ve optional'lar:**
`DateComponents` ile tarih üretmeyi öğrendim.
`Calendar.current.date(from:)` her zaman geçerli bir `Date` üretemeyebildiği için optional döndürüyor, bunu `guard let` ile güvenle açmayı kavradım.

### En çok zorlayan 3 konu

- **Para hesabı (`Decimal`, yuvarlama):**
Kullanıcının girdiği tutarı iki basamağa yuvarlayıp kaydetmek kolaydı ancak asıl istediğim şey değeri değiştirmeden korumak ve üç ondalık basamaklı bir girişin sessizce yuvarlanmasını engellemekti. `Decimal`, `Double` ve `NSDecimalRound` arasındaki farkları anlamak zaman aldı.

- **View'ler arasındaki veri akışı:**
`AddExpenseView` içinde oluşturulan bir harcamanın `ContentView`'e nasıl ulaştığını anlamakta zorlandım.
Özellikle veriyi oluşturmakla veriyi kaydetmek arasındaki sorumluluk farkını kavramam gerekti.

- **Tarih oluşturma ve optional mantığı:**
`Calendar.current.date(from:)` fonksiyonunun her zaman geçerli bir `Date` üretmemesi ve bu nedenle optional dönmesi ilk başta kafa karıştırıcıydı.

### Saatler gerçekçi miydi?

10 saat. Bu sayı yalnızca pazar ve pazartesi toplamı, hafta içi çalışmayı isteğe bağlı yaptığımız için dahil değil.
Planladığım 16 saatlik bloğun tamamını verimli kullanamadım.
Kodlama, hata ayıklama ve konuları anlamaya ayırdığım gerçek süre planladığımdan farklı oldu.

### Gelecek hafta değiştireceğim bir şey

- Her anlamlı geliştirmeden ve çalışan bir değişiklikten sonra commit ve push yapacağım.

### One-line summary in English

I learned to debug by isolating code and re-enabling it step by step.
