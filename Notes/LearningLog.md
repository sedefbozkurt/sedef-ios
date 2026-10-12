# LearningLog

## Codable, CaseIterable ve Identifiable neden gerekiyor?

**CaseIterable =** Bana bu enum içindeki bütün seçenekleri ver.
**Codable =** Swift nesnesini uygun bir formata dönüştür ve gerektiğinde geri oluştur.
**Identifiable =** Bu öğe hangisi? Diğer öğelerden nasıl ayırt edilecek?

### Mentor sorusu: `var id: Self { self }` satırını nasıl yazabildin? `Identifiable`'ın `ID` gereksinimi nedir ve `Category` buna nasıl uyabiliyor?

`Identifiable`, bir `ID` tipi ister ve bu tip `Hashable` olmak zorundadır.
İlişkili değeri (associated value) olmayan enum'lar otomatik olarak `Hashable` olur.
Bu yüzden `Category`, kendi değerini kimlik olarak kullanabilir:

- **Category:** `var id: Self { self }`
- **Expense:** Her harcama için benzersiz bir kimlik gerekir -> `let id: UUID`

**Önemli nokta:** `Identifiable`, mutlaka `UUID` kullanmanı istemez.
Sadece kararlı, benzersiz ve `Hashable` bir kimlik sunmanı ister.
Kimliğin türünü ve nasıl oluşturulacağını modelin ihtiyaçlarına göre sen belirlersin.

### Mentor sorusu: `guard`'ın `else` bloğunda `return` yazmadın, derleyici neden kabul etti?

`guard`'ın `else` bloğunun kapsamdan çıkması gerekir; bu çıkışın mutlaka `return` olması gerekmez.
`preconditionFailure` bir `Never` döndürür yani "buradan kontrol asla geri gelmez" demektir.
Derleyici de bu yüzden çıkışın garanti olduğunu kabul eder.

`else` bloğundan şunlarla çıkılabilir: `return`, `break`, `continue`, `throw` veya `Never` dönen bir çağrı (`fatalError`, `preconditionFailure`).
