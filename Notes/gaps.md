# gaps

## Tutarı para formatıyla gösterme

```swift
Text(amount, format: .currency(code: "TRY"))
```

## Para için Double yerine neden Decimal?

Para tutarları için genellikle `Double` yerine `Decimal` tercih edilir.
`Double` genel amaçlı sayısal hesaplamalar içindir; `Decimal` ise ondalık hassasiyetin önemli olduğu parasal hesaplamalar için daha uygundur.

**Neden:** `Double` ikili kayan nokta sistemiyle temsil edilir ve bazı ondalıklı sayılar bellekte tam olarak saklanamaz.
Örnek: `0.1 + 0.2` Double'da tam `0.3` etmez.

## @State ve private

**@State:** View'ın kendine ait, basit değer tipli verisi. Değer değişince SwiftUI `body`'yi yeniden hesaplar ve arayüzü günceller.

**private:** Değişkene yalnızca tanımlandığı kapsamın içinden erişilmesini sağlar (erişim kontrolü).

**Bağlantı:** `@State` verisinin sahibi view'ın kendisidir, dışarıdan değiştirilmemelidir. Bu yüzden genelde `@State private var` olarak yazılır.
