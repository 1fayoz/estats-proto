# estats/proto

eStats xizmatlari orasidagi gRPC shartnomalari. Har xizmat buni
**submodul** sifatida oladi va o'z tilida kod generatsiya qiladi.

Nusxa ko'chirilmaydi: nusxa olingan sniyatdan boshlab ikki tomonda
ikki xil versiya yashaydi va buni faqat prodda bilib qolasan.

## Paketlar

| Paket | Kim bajaradi | Kim chaqiradi |
|---|---|---|
| `estats.common.v1` | — | hammasi |
| `estats.identity.v1` | `identity` | hammasi |
| `estats.marketplace.v1` | har marketpleys adapteri | `core`, `seo` |
| `estats.notifier.v1` | `bot` | `core`, `seo`, `social` |

## Generatsiya

```bash
make python OUT=../estats-identity/gen   # Python xizmat uchun
make go     OUT=../some-go-service/gen   # kelajakda Go uchun
```

## Qoidalar

1. **Maydon raqami hech qachon qayta ishlatilmaydi.** O'chirilgan
   maydon `reserved` ga tushadi — aks holda eski xizmat yangi
   ma'lumotni noto'g'ri o'qiydi.
2. **Yangi maydon har doim ixtiyoriy.** Majburiy maydon qo'shish —
   eski xizmatni sindirish.
3. **Pul faqat `Money` orqali.** Valyutasiz summa aralashib ketadi.
4. **Yo'q narsa nol emas.** Marketpleys ma'lumot bermasa, maydon
   umuman yuborilmaydi — nol yozilsa, hisobot yolg'on ko'rsatadi.
