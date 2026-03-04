# ≡ƒñû AI for Revit

**Trß╗ú l├╜ AI th├┤ng minh gi├║p bß║ín truy vß║Ñn v├á ph├ón t├¡ch m├┤ h├¼nh Revit bß║▒ng ng├┤n ngß╗» tß╗▒ nhi├¬n.**

Chß╗ë cß║ºn m├┤ tß║ú y├¬u cß║ºu ΓÇö AI sß║╜ tß╗▒ ─æß╗Öng truy vß║Ñn dß╗» liß╗çu tß╗½ m├┤ h├¼nh Revit v├á trß║ú kß║┐t quß║ú ngay trong editor.

---

## Γ£¿ T├¡nh n─âng hiß╗çn c├│

| Nh├│m | T├¡nh n─âng | V├¡ dß╗Ñ c├óu hß╗Åi |
|:---|:---|:---|
| **≡ƒôè Thß╗æng k├¬** | ─Éß║┐m, tß╗òng hß╗úp, nh├│m theo type | "Thß╗æng k├¬ sß╗æ l╞░ß╗úng ß╗æng theo loß║íi" |
| **≡ƒöì Truy vß║Ñn** | Lß╗ìc elements theo category, type, parameter | "Liß╗çt k├¬ tß║Ñt cß║ú ß╗æng c├│ k├¡ch th╞░ß╗¢c DN100" |
| **≡ƒôï Schedule** | ─Éß╗ìc v├á xuß║Ñt dß╗» liß╗çu schedule | "Cho t├┤i xem schedule Pipe Schedule" |
| **≡ƒôÉ Parameters** | ─Éß╗ìc/ghi parameter cß╗ºa element | "─Éß╗ìc parameters cß╗ºa element ID 12345" |
| **≡ƒÅ╖∩╕Å Categories** | Liß╗çt k├¬ categories trong m├┤ h├¼nh | "Trong m├┤ h├¼nh c├│ nhß╗»ng category n├áo?" |
| **≡ƒæå Selection** | Thao t├íc vß╗¢i elements ─æang chß╗ìn | "Thß╗æng k├¬ phß╗Ñ kiß╗çn trong c├íc ─æß╗æi t╞░ß╗úng ─æang chß╗ìn" |
| **ΓÜá∩╕Å Warnings** | Kiß╗âm tra cß║únh b├ío m├┤ h├¼nh | "M├┤ h├¼nh c├│ bao nhi├¬u warnings?" |
| **≡ƒôü Worksets** | Kiß╗âm tra worksets | "Liß╗çt k├¬ c├íc worksets trong dß╗▒ ├ín" |
| **≡ƒöù Links** | Th├┤ng tin Revit Links | "C├│ nhß╗»ng linked model n├áo?" |
| **≡ƒÅù∩╕Å Views/Sheets** | Danh s├ích Views v├á Sheets | "Liß╗çt k├¬ tß║Ñt cß║ú sheets" |
| **Γä╣∩╕Å Project Info** | Th├┤ng tin dß╗▒ ├ín | "Th├┤ng tin dß╗▒ ├ín ─æang mß╗ƒ l├á g├¼?" |

### Categories hß╗ù trß╗ú
Walls, Floors, Columns, Structural Framing, Ducts, Duct Fittings, Pipes, Pipe Fittings, Cable Trays, Cable Tray Fittings, Conduits, Conduit Fittings, Mechanical Equipment, Sprinklers, Doors, Windows, Rooms, Ceilings, Stairs, Railings, Generic Models, Furniture, Grids, Levels.

---

## ≡ƒÜÇ C├ái ─æß║╖t

### B╞░ß╗¢c 1: C├ái ─æß║╖t Antigravity (IDE)

Antigravity l├á IDE (tr├¼nh soß║ín thß║úo code) t├¡ch hß╗úp AI, dß╗▒a tr├¬n VS Code.

1. Truy cß║¡p **[antigravity.google](https://antigravity.google)** 
2. Tß║úi bß║ún c├ái ─æß║╖t cho Windows
3. Chß║íy file c├ái ─æß║╖t v├á l├ám theo h╞░ß╗¢ng dß║½n
4. Khi khß╗ƒi ─æß╗Öng lß║ºn ─æß║ºu, **─æ─âng nhß║¡p bß║▒ng t├ái khoß║ún Google** cß╗ºa bß║ín
5. Chß╗ìn theme (giao diß╗çn) y├¬u th├¡ch

> ≡ƒÆí **Tip**: Nß║┐u bß║ín ─æ├ú d├╣ng VS Code, chß╗ìn "Import from Visual Studio Code" ─æß╗â giß╗» lß║íi c├íc c├ái ─æß║╖t c┼⌐.

### B╞░ß╗¢c 2: C├ái ─æß║╖t Plugin Revit

1. Giß║úi n├⌐n (hoß║╖c mß╗ƒ) folder **AI-for-Revit**
2. **Double-click v├áo `install.bat`** ΓÇö script sß║╜ tß╗▒ ─æß╗Öng copy plugin v├áo Revit
3. Hß╗ù trß╗ú **Revit 2023** v├á **Revit 2024**

> ΓÜá∩╕Å **L╞░u ├╜**: ─É├│ng Revit tr╞░ß╗¢c khi chß║íy install.bat nß║┐u ─æang mß╗ƒ.

### B╞░ß╗¢c 3: Bß║»t ─æß║ºu sß╗¡ dß╗Ñng

1. Mß╗ƒ **folder `AI-for-Revit`** trong Antigravity (File ΓåÆ Open Folder)
2. Mß╗ƒ cß╗¡a sß╗ò chat (Agent panel)
3. G├╡ **`/start`** ΓåÆ AI sß║╜ nß║íp tri thß╗⌐c v├á kiß╗âm tra kß║┐t nß╗æi Revit
4. Bß║»t ─æß║ºu ─æß║╖t y├¬u cß║ºu bß║▒ng tiß║┐ng Viß╗çt! ≡ƒÄë

---

## ≡ƒÆÄ T├ái khoß║ún Gemini ΓÇö So s├ính c├íc g├│i

AI for Revit sß╗¡ dß╗Ñng Gemini AI th├┤ng qua t├ái khoß║ún Google cß╗ºa bß║ín. **Thß╗¥i l╞░ß╗úng truy vß║Ñn phß╗Ñ thuß╗Öc v├áo loß║íi t├ái khoß║ún:**

| | **≡ƒåô Free** | **≡ƒÆ│ Google AI Pro ($20/th├íng)** | **≡ƒææ Google AI Ultra ($250/th├íng)** |
|:---|:---:|:---:|:---:|
| **Model ch├¡nh** | Gemini Flash | Gemini Pro + Flash | Gemini Pro + Flash |
| **Sß╗æ truy vß║Ñn/ng├áy** | ~20ΓÇô50 | ~100ΓÇô1,500 | ~500ΓÇô1,500 |
| **Tß╗æc ─æß╗Ö phß║ún hß╗ôi** | B├¼nh th╞░ß╗¥ng | Nhanh | Nhanh nhß║Ñt |
| **Ph├╣ hß╗úp** | D├╣ng thß╗¡, ├¡t truy vß║Ñn | D├╣ng h├áng ng├áy | D├╣ng chuy├¬n s├óu |

> ≡ƒô¥ **Ghi ch├║**: Sß╗æ truy vß║Ñn thß╗▒c tß║┐ c├│ thß╗â thay ─æß╗òi t├╣y theo ch├¡nh s├ích Google.

---

## ΓÜí C├ái ─æß║╖t khuyß║┐n nghß╗ï ΓÇö Tß╗æi ╞░u tß╗æc ─æß╗Ö

─Éß╗â c├│ **trß║úi nghiß╗çm nhanh nhß║Ñt** v├á **tiß║┐t kiß╗çm quota**, h├úy cß║Ñu h├¼nh trong Antigravity:

### 1. Chß╗ìn chß║┐ ─æß╗Ö Fast
- Mß╗ƒ **Settings** trong Antigravity
- T├¼m mß╗Ñc **Agent Mode** hoß║╖c **Speed**
- Chß╗ìn **Fast** thay v├¼ Standard/Thorough

### 2. Chß╗ìn model Gemini Flash
- Trong cß╗¡a sß╗ò chat, chß╗ìn model: **Gemini Flash** (thay v├¼ Gemini Pro)
- Flash nhanh h╞ín 2-3x v├á ti├¬u tß╗æn ├¡t quota h╞ín
- ─Éß╗º mß║ính cho hß║ºu hß║┐t c├íc truy vß║Ñn Revit

> ≡ƒÆí **Khi n├áo d├╣ng Gemini Pro?** Chß╗ë khi cß║ºn ph├ón t├¡ch phß╗⌐c tß║íp (thß╗æng k├¬ nhiß╗üu b╞░ß╗¢c, so s├ính dß╗» liß╗çu lß╗¢n). C├íc truy vß║Ñn th├┤ng th╞░ß╗¥ng d├╣ng Flash l├á ─æß╗º.

---

## ≡ƒôû H╞░ß╗¢ng dß║½n sß╗¡ dß╗Ñng

### Khß╗ƒi ─æß╗Öng (mß╗ùi lß║ºn mß╗ƒ Antigravity mß╗¢i)
```
/start
```
AI sß║╜ nß║íp tri thß╗⌐c v├á kiß╗âm tra kß║┐t nß╗æi Revit.

### V├¡ dß╗Ñ truy vß║Ñn

**Thß╗æng k├¬:**
```
Thß╗æng k├¬ tß╗òng chiß╗üu d├ái ß╗æng theo loß║íi
─Éß║┐m sß╗æ l╞░ß╗úng duct fittings trong m├┤ h├¼nh
Liß╗çt k├¬ khß╗æi l╞░ß╗úng phß╗Ñ kiß╗çn ─æang chß╗ìn
```

**Truy vß║Ñn cß╗Ñ thß╗â:**
```
Cho t├┤i xem parameters cß╗ºa element ID 123456
T├¼m tß║Ñt cß║ú ß╗æng c├│ ─æ╞░ß╗¥ng k├¡nh lß╗¢n h╞ín DN200
Liß╗çt k├¬ tß║Ñt cß║ú views trong dß╗▒ ├ín
```

**Thao t├íc:**
```
Chß╗ìn (highlight) tß║Ñt cß║ú Pipe Fittings trong m├┤ h├¼nh
Trong m├┤ h├¼nh c├│ bao nhi├¬u warnings?
Workset n├áo ─æang trß╗æng?
```

**Schedule:**
```
Liß╗çt k├¬ c├íc schedule c├│ trong m├┤ h├¼nh
Cho t├┤i xem dß╗» liß╗çu schedule "Pipe Schedule"
```

### L╞░u ├╜ quan trß╗ìng
- Lu├┤n g├╡ `/start` khi mß╗ƒ cß╗¡a sß╗ò chat mß╗¢i
- Revit phß║úi ─æang mß╗ƒ v├á model ─æ├ú load
- AI trß║ú lß╗¥i bß║▒ng **tiß║┐ng Viß╗çt**
- Nß║┐u AI kh├┤ng thß╗▒c hiß╗çn ─æ╞░ß╗úc y├¬u cß║ºu, n├│ sß║╜ **tß╗▒ ─æß╗Öng gß╗¡i y├¬u cß║ºu cho ─æß╗Öi ph├ít triß╗ân** ─æß╗â cß║¡p nhß║¡t t├¡nh n─âng

---

## ≡ƒöº Y├¬u cß║ºu hß╗ç thß╗æng

| Th├ánh phß║ºn | Y├¬u cß║ºu |
|:---|:---|
| **Revit** | 2023 hoß║╖c 2024 |
| **Hß╗ç ─æiß╗üu h├ánh** | Windows 10/11 (64-bit) |
| **IDE** | Antigravity (tß║úi tß║íi [antigravity.google](https://antigravity.google)) |
| **T├ái khoß║ún** | Google account (Free hoß║╖c trß║ú ph├¡) |
| **Kß║┐t nß╗æi mß║íng** | Cß║ºn internet ─æß╗â gß╗ìi AI |

---

## Γ¥ô FAQ

**Q: AI c├│ thß╗â sß╗¡a/th├¬m/x├│a elements trong m├┤ h├¼nh kh├┤ng?**  
A: Hiß╗çn tß║íi AI c├│ thß╗â **─æß╗ìc** v├á **set parameter** cho elements. Ch╞░a hß╗ù trß╗ú tß║ío mß╗¢i hoß║╖c x├│a elements.

**Q: T├┤i muß╗æn AI l├ám th├¬m t├¡nh n─âng X th├¼ sao?**  
A: Cß╗⌐ y├¬u cß║ºu AI! Nß║┐u t├¡nh n─âng ch╞░a c├│, AI sß║╜ tß╗▒ ─æß╗Öng ghi nhß║¡n v├á gß╗¡i y├¬u cß║ºu cho ─æß╗Öi ph├ít triß╗ân.

**Q: Dß╗» liß╗çu m├┤ h├¼nh c├│ bß╗ï gß╗¡i ra ngo├ái kh├┤ng?**  
A: Dß╗» liß╗çu ─æ╞░ß╗úc xß╗¡ l├╜ **local tr├¬n m├íy bß║ín**. Chß╗ë c├óu hß╗Åi v├á kß║┐t quß║ú truy vß║Ñn ─æ╞░ß╗úc gß╗¡i tß╗¢i Gemini AI ─æß╗â ph├ón t├¡ch.

**Q: Plugin c├│ xung ─æß╗Öt vß╗¢i addon kh├íc kh├┤ng?**  
A: Kh├┤ng. Plugin hoß║ít ─æß╗Öng ─æß╗Öc lß║¡p, kh├┤ng can thiß╗çp v├áo c├íc addon kh├íc.

---

*Ph├ít triß╗ân bß╗ƒi Central-NguyenAn ΓÇó Phi├¬n bß║ún 1.0*
