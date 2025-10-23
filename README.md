# card.immutability.space

Neon-magenta cyberpunk hub for ImmutableMike — deployed on Vercel.

## Deploy

```bash
git clone https://github.com/immutablemike/card.immutability.space.git
cd card.immutability.space
vercel --prod
```

Then add a CNAME in Cloudflare:

```
card  CNAME  cname.vercel-dns.com
```

Your NFC tag URI:

```
https://card.immutability.space
```

Write with NFC Tools → Type "URL/URI" → Paste → Write Tag → Test.

## Edit

- Logos in `/public/logos/`
- Contact card in `/public/me.vcf`
- Styling in `/style.css`
- Links & text in `/index.html`

---

### `/public/logos/`
Put your four local PNGs here:

- `immutability.png`
- `humanatlas.png`
- `eli5.png`
- `leandeck.png`

---

**Deploy Steps**

```bash
git init
git remote add origin https://github.com/immutablemike/card.immutability.space.git
git add .
git commit -m "initial commit"
git push -u origin main
vercel --prod
```

You'll get a live URL in seconds; connect your subdomain; test NFC.

That's your whole stack — production-ready, dark, and fast.