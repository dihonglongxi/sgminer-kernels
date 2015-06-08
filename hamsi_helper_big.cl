/* $Id: hamsi_helper.c 202 2010-05-31 15:46:48Z tp $ */
/*
 * Helper code for Hamsi (input block expansion). This code is
 * automatically generated and includes precomputed tables for
 * expansion code which handles 2 to 8 bits at a time.
 *
 * This file is included from hamsi.c, and is not meant to be compiled
 * independently.
 *
 * ==========================(LICENSE BEGIN)============================
 *
 * Copyright (c) 2007-2010  Projet RNRT SAPHIR
 *
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the
 * "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
 * IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
 * CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
 * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
 * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 *
 * ===========================(LICENSE END)=============================
 *
 * @author   Thomas Pornin <thomas.pornin@cryptolog.com>
 */

#if SPH_HAMSI_EXPAND_BIG == 1

/* Note: this table lists bits within each byte from least
   siginificant to most significant. */
__constant const sph_u32 T512[64][16] = {
    {
        SPH_C32(0xef0b0270), SPH_C32(0x3afd0000), SPH_C32(0x5dae0000),
        SPH_C32(0x69490000), SPH_C32(0x9b0f3c06), SPH_C32(0x4405b5f9),
        SPH_C32(0x66140a51), SPH_C32(0x924f5d0a), SPH_C32(0xc96b0030),
        SPH_C32(0xe7250000), SPH_C32(0x2f840000), SPH_C32(0x264f0000),
        SPH_C32(0x08695bf9), SPH_C32(0x6dfcf137), SPH_C32(0x509f6984),
        SPH_C32(0x9e69af68)
    },
    {
        SPH_C32(0xc96b0030), SPH_C32(0xe7250000), SPH_C32(0x2f840000),
        SPH_C32(0x264f0000), SPH_C32(0x08695bf9), SPH_C32(0x6dfcf137),
        SPH_C32(0x509f6984), SPH_C32(0x9e69af68), SPH_C32(0x26600240),
        SPH_C32(0xddd80000), SPH_C32(0x722a0000), SPH_C32(0x4f060000),
        SPH_C32(0x936667ff), SPH_C32(0x29f944ce), SPH_C32(0x368b63d5),
        SPH_C32(0x0c26f262)
    },
    {
        SPH_C32(0x145a3c00), SPH_C32(0xb9e90000), SPH_C32(0x61270000),
        SPH_C32(0xf1610000), SPH_C32(0xce613d6c), SPH_C32(0xb0493d78),
        SPH_C32(0x47a96720), SPH_C32(0xe18e24c5), SPH_C32(0x23671400),
        SPH_C32(0xc8b90000), SPH_C32(0xf4c70000), SPH_C32(0xfb750000),
        SPH_C32(0x73cd2465), SPH_C32(0xf8a6a549), SPH_C32(0x02c40a3f),
        SPH_C32(0xdc24e61f)
    },
    {
        SPH_C32(0x23671400), SPH_C32(0xc8b90000), SPH_C32(0xf4c70000),
        SPH_C32(0xfb750000), SPH_C32(0x73cd2465), SPH_C32(0xf8a6a549),
        SPH_C32(0x02c40a3f), SPH_C32(0xdc24e61f), SPH_C32(0x373d2800),
        SPH_C32(0x71500000), SPH_C32(0x95e00000), SPH_C32(0x0a140000),
        SPH_C32(0xbdac1909), SPH_C32(0x48ef9831), SPH_C32(0x456d6d1f),
        SPH_C32(0x3daac2da)
    },
    {
        SPH_C32(0x54285c00), SPH_C32(0xeaed0000), SPH_C32(0xc5d60000),
        SPH_C32(0xa1c50000), SPH_C32(0xb3a26770), SPH_C32(0x94a5c4e1),
        SPH_C32(0x6bb0419d), SPH_C32(0x551b3782), SPH_C32(0x9cbb1800),
        SPH_C32(0xb0d30000), SPH_C32(0x92510000), SPH_C32(0xed930000),
        SPH_C32(0x593a4345), SPH_C32(0xe114d5f4), SPH_C32(0x430633da),
        SPH_C32(0x78cace29)
    },
    {
        SPH_C32(0x9cbb1800), SPH_C32(0xb0d30000), SPH_C32(0x92510000),
        SPH_C32(0xed930000), SPH_C32(0x593a4345), SPH_C32(0xe114d5f4),
        SPH_C32(0x430633da), SPH_C32(0x78cace29), SPH_C32(0xc8934400),
        SPH_C32(0x5a3e0000), SPH_C32(0x57870000), SPH_C32(0x4c560000),
        SPH_C32(0xea982435), SPH_C32(0x75b11115), SPH_C32(0x28b67247),
        SPH_C32(0x2dd1f9ab)
    },
    {
        SPH_C32(0x29449c00), SPH_C32(0x64e70000), SPH_C32(0xf24b0000),
        SPH_C32(0xc2f30000), SPH_C32(0x0ede4e8f), SPH_C32(0x56c23745),
        SPH_C32(0xf3e04259), SPH_C32(0x8d0d9ec4), SPH_C32(0x466d0c00),
        SPH_C32(0x08620000), SPH_C32(0xdd5d0000), SPH_C32(0xbadd0000),
        SPH_C32(0x6a927942), SPH_C32(0x441f2b93), SPH_C32(0x218ace6f),
        SPH_C32(0xbf2c0be2)
    },
    {
        SPH_C32(0x466d0c00), SPH_C32(0x08620000), SPH_C32(0xdd5d0000),
        SPH_C32(0xbadd0000), SPH_C32(0x6a927942), SPH_C32(0x441f2b93),
        SPH_C32(0x218ace6f), SPH_C32(0xbf2c0be2), SPH_C32(0x6f299000),
        SPH_C32(0x6c850000), SPH_C32(0x2f160000), SPH_C32(0x782e0000),
        SPH_C32(0x644c37cd), SPH_C32(0x12dd1cd6), SPH_C32(0xd26a8c36),
        SPH_C32(0x32219526)
    },
    {
        SPH_C32(0xf6800005), SPH_C32(0x3443c000), SPH_C32(0x24070000),
        SPH_C32(0x8f3d0000), SPH_C32(0x21373bfb), SPH_C32(0x0ab8d5ae),
        SPH_C32(0xcdc58b19), SPH_C32(0xd795ba31), SPH_C32(0xa67f0001),
        SPH_C32(0x71378000), SPH_C32(0x19fc0000), SPH_C32(0x96db0000),
        SPH_C32(0x3a8b6dfd), SPH_C32(0xebcaaef3), SPH_C32(0x2c6d478f),
        SPH_C32(0xac8e6c88)
    },
    {
        SPH_C32(0xa67f0001), SPH_C32(0x71378000), SPH_C32(0x19fc0000),
        SPH_C32(0x96db0000), SPH_C32(0x3a8b6dfd), SPH_C32(0xebcaaef3),
        SPH_C32(0x2c6d478f), SPH_C32(0xac8e6c88), SPH_C32(0x50ff0004),
        SPH_C32(0x45744000), SPH_C32(0x3dfb0000), SPH_C32(0x19e60000),
        SPH_C32(0x1bbc5606), SPH_C32(0xe1727b5d), SPH_C32(0xe1a8cc96),
        SPH_C32(0x7b1bd6b9)
    },
    {
        SPH_C32(0xf7750009), SPH_C32(0xcf3cc000), SPH_C32(0xc3d60000),
        SPH_C32(0x04920000), SPH_C32(0x029519a9), SPH_C32(0xf8e836ba),
        SPH_C32(0x7a87f14e), SPH_C32(0x9e16981a), SPH_C32(0xd46a0000),
        SPH_C32(0x8dc8c000), SPH_C32(0xa5af0000), SPH_C32(0x4a290000),
        SPH_C32(0xfc4e427a), SPH_C32(0xc9b4866c), SPH_C32(0x98369604),
        SPH_C32(0xf746c320)
    },
    {
        SPH_C32(0xd46a0000), SPH_C32(0x8dc8c000), SPH_C32(0xa5af0000),
        SPH_C32(0x4a290000), SPH_C32(0xfc4e427a), SPH_C32(0xc9b4866c),
        SPH_C32(0x98369604), SPH_C32(0xf746c320), SPH_C32(0x231f0009),
        SPH_C32(0x42f40000), SPH_C32(0x66790000), SPH_C32(0x4ebb0000),
        SPH_C32(0xfedb5bd3), SPH_C32(0x315cb0d6), SPH_C32(0xe2b1674a),
        SPH_C32(0x69505b3a)
    },
    {
        SPH_C32(0x774400f0), SPH_C32(0xf15a0000), SPH_C32(0xf5b20000),
        SPH_C32(0x34140000), SPH_C32(0x89377e8c), SPH_C32(0x5a8bec25),
        SPH_C32(0x0bc3cd1e), SPH_C32(0xcf3775cb), SPH_C32(0xf46c0050),
        SPH_C32(0x96180000), SPH_C32(0x14a50000), SPH_C32(0x031f0000),
        SPH_C32(0x42947eb8), SPH_C32(0x66bf7e19), SPH_C32(0x9ca470d2),
        SPH_C32(0x8a341574)
    },
    {
        SPH_C32(0xf46c0050), SPH_C32(0x96180000), SPH_C32(0x14a50000),
        SPH_C32(0x031f0000), SPH_C32(0x42947eb8), SPH_C32(0x66bf7e19),
        SPH_C32(0x9ca470d2), SPH_C32(0x8a341574), SPH_C32(0x832800a0),
        SPH_C32(0x67420000), SPH_C32(0xe1170000), SPH_C32(0x370b0000),
        SPH_C32(0xcba30034), SPH_C32(0x3c34923c), SPH_C32(0x9767bdcc),
        SPH_C32(0x450360bf)
    },
    {
        SPH_C32(0xe8870170), SPH_C32(0x9d720000), SPH_C32(0x12db0000),
        SPH_C32(0xd4220000), SPH_C32(0xf2886b27), SPH_C32(0xa921e543),
        SPH_C32(0x4ef8b518), SPH_C32(0x618813b1), SPH_C32(0xb4370060),
        SPH_C32(0x0c4c0000), SPH_C32(0x56c20000), SPH_C32(0x5cae0000),
        SPH_C32(0x94541f3f), SPH_C32(0x3b3ef825), SPH_C32(0x1b365f3d),
        SPH_C32(0xf3d45758)
    },
    {
        SPH_C32(0xb4370060), SPH_C32(0x0c4c0000), SPH_C32(0x56c20000),
        SPH_C32(0x5cae0000), SPH_C32(0x94541f3f), SPH_C32(0x3b3ef825),
        SPH_C32(0x1b365f3d), SPH_C32(0xf3d45758), SPH_C32(0x5cb00110),
        SPH_C32(0x913e0000), SPH_C32(0x44190000), SPH_C32(0x888c0000),
        SPH_C32(0x66dc7418), SPH_C32(0x921f1d66), SPH_C32(0x55ceea25),
        SPH_C32(0x925c44e9)
    },
    {
        SPH_C32(0x0c720000), SPH_C32(0x49e50f00), SPH_C32(0x42790000),
        SPH_C32(0x5cea0000), SPH_C32(0x33aa301a), SPH_C32(0x15822514),
        SPH_C32(0x95a34b7b), SPH_C32(0xb44b0090), SPH_C32(0xfe220000),
        SPH_C32(0xa7580500), SPH_C32(0x25d10000), SPH_C32(0xf7600000),
        SPH_C32(0x893178da), SPH_C32(0x1fd4f860), SPH_C32(0x4ed0a315),
        SPH_C32(0xa123ff9f)
    },
    {
        SPH_C32(0xfe220000), SPH_C32(0xa7580500), SPH_C32(0x25d10000),
        SPH_C32(0xf7600000), SPH_C32(0x893178da), SPH_C32(0x1fd4f860),
        SPH_C32(0x4ed0a315), SPH_C32(0xa123ff9f), SPH_C32(0xf2500000),
        SPH_C32(0xeebd0a00), SPH_C32(0x67a80000), SPH_C32(0xab8a0000),
        SPH_C32(0xba9b48c0), SPH_C32(0x0a56dd74), SPH_C32(0xdb73e86e),
        SPH_C32(0x1568ff0f)
    },
    {
        SPH_C32(0x45180000), SPH_C32(0xa5b51700), SPH_C32(0xf96a0000),
        SPH_C32(0x3b480000), SPH_C32(0x1ecc142c), SPH_C32(0x231395d6),
        SPH_C32(0x16bca6b0), SPH_C32(0xdf33f4df), SPH_C32(0xb83d0000),
        SPH_C32(0x16710600), SPH_C32(0x379a0000), SPH_C32(0xf5b10000),
        SPH_C32(0x228161ac), SPH_C32(0xae48f145), SPH_C32(0x66241616),
        SPH_C32(0xc5c1eb3e)
    },
    {
        SPH_C32(0xb83d0000), SPH_C32(0x16710600), SPH_C32(0x379a0000),
        SPH_C32(0xf5b10000), SPH_C32(0x228161ac), SPH_C32(0xae48f145),
        SPH_C32(0x66241616), SPH_C32(0xc5c1eb3e), SPH_C32(0xfd250000),
        SPH_C32(0xb3c41100), SPH_C32(0xcef00000), SPH_C32(0xcef90000),
        SPH_C32(0x3c4d7580), SPH_C32(0x8d5b6493), SPH_C32(0x7098b0a6),
        SPH_C32(0x1af21fe1)
    },
    {
        SPH_C32(0x75a40000), SPH_C32(0xc28b2700), SPH_C32(0x94a40000),
        SPH_C32(0x90f50000), SPH_C32(0xfb7857e0), SPH_C32(0x49ce0bae),
        SPH_C32(0x1767c483), SPH_C32(0xaedf667e), SPH_C32(0xd1660000),
        SPH_C32(0x1bbc0300), SPH_C32(0x9eec0000), SPH_C32(0xf6940000),
        SPH_C32(0x03024527), SPH_C32(0xcf70fcf2), SPH_C32(0xb4431b17),
        SPH_C32(0x857f3c2b)
    },
    {
        SPH_C32(0xd1660000), SPH_C32(0x1bbc0300), SPH_C32(0x9eec0000),
        SPH_C32(0xf6940000), SPH_C32(0x03024527), SPH_C32(0xcf70fcf2),
        SPH_C32(0xb4431b17), SPH_C32(0x857f3c2b), SPH_C32(0xa4c20000),
        SPH_C32(0xd9372400), SPH_C32(0x0a480000), SPH_C32(0x66610000),
        SPH_C32(0xf87a12c7), SPH_C32(0x86bef75c), SPH_C32(0xa324df94),
        SPH_C32(0x2ba05a55)
    },
    {
        SPH_C32(0x75c90003), SPH_C32(0x0e10c000), SPH_C32(0xd1200000),
        SPH_C32(0xbaea0000), SPH_C32(0x8bc42f3e), SPH_C32(0x8758b757),
        SPH_C32(0xbb28761d), SPH_C32(0x00b72e2b), SPH_C32(0xeecf0001),
        SPH_C32(0x6f564000), SPH_C32(0xf33e0000), SPH_C32(0xa79e0000),
        SPH_C32(0xbdb57219), SPH_C32(0xb711ebc5), SPH_C32(0x4a3b40ba),
        SPH_C32(0xfeabf254)
    },
    {
        SPH_C32(0xeecf0001), SPH_C32(0x6f564000), SPH_C32(0xf33e0000),
        SPH_C32(0xa79e0000), SPH_C32(0xbdb57219), SPH_C32(0xb711ebc5),
        SPH_C32(0x4a3b40ba), SPH_C32(0xfeabf254), SPH_C32(0x9b060002),
        SPH_C32(0x61468000), SPH_C32(0x221e0000), SPH_C32(0x1d740000),
        SPH_C32(0x36715d27), SPH_C32(0x30495c92), SPH_C32(0xf11336a7),
        SPH_C32(0xfe1cdc7f)
    },
    {
        SPH_C32(0x86790000), SPH_C32(0x3f390002), SPH_C32(0xe19ae000),
        SPH_C32(0x98560000), SPH_C32(0x9565670e), SPH_C32(0x4e88c8ea),
        SPH_C32(0xd3dd4944), SPH_C32(0x161ddab9), SPH_C32(0x30b70000),
        SPH_C32(0xe5d00000), SPH_C32(0xf4f46000), SPH_C32(0x42c40000),
        SPH_C32(0x63b83d6a), SPH_C32(0x78ba9460), SPH_C32(0x21afa1ea),
        SPH_C32(0xb0a51834)
    },
    {
        SPH_C32(0x30b70000), SPH_C32(0xe5d00000), SPH_C32(0xf4f46000),
        SPH_C32(0x42c40000), SPH_C32(0x63b83d6a), SPH_C32(0x78ba9460),
        SPH_C32(0x21afa1ea), SPH_C32(0xb0a51834), SPH_C32(0xb6ce0000),
        SPH_C32(0xdae90002), SPH_C32(0x156e8000), SPH_C32(0xda920000),
        SPH_C32(0xf6dd5a64), SPH_C32(0x36325c8a), SPH_C32(0xf272e8ae),
        SPH_C32(0xa6b8c28d)
    },
    {
        SPH_C32(0x14190000), SPH_C32(0x23ca003c), SPH_C32(0x50df0000),
        SPH_C32(0x44b60000), SPH_C32(0x1b6c67b0), SPH_C32(0x3cf3ac75),
        SPH_C32(0x61e610b0), SPH_C32(0xdbcadb80), SPH_C32(0xe3430000),
        SPH_C32(0x3a4e0014), SPH_C32(0xf2c60000), SPH_C32(0xaa4e0000),
        SPH_C32(0xdb1e42a6), SPH_C32(0x256bbe15), SPH_C32(0x123db156),
        SPH_C32(0x3a4e99d7)
    },
    {
        SPH_C32(0xe3430000), SPH_C32(0x3a4e0014), SPH_C32(0xf2c60000),
        SPH_C32(0xaa4e0000), SPH_C32(0xdb1e42a6), SPH_C32(0x256bbe15),
        SPH_C32(0x123db156), SPH_C32(0x3a4e99d7), SPH_C32(0xf75a0000),
        SPH_C32(0x19840028), SPH_C32(0xa2190000), SPH_C32(0xeef80000),
        SPH_C32(0xc0722516), SPH_C32(0x19981260), SPH_C32(0x73dba1e6),
        SPH_C32(0xe1844257)
    },
    {
        SPH_C32(0x54500000), SPH_C32(0x0671005c), SPH_C32(0x25ae0000),
        SPH_C32(0x6a1e0000), SPH_C32(0x2ea54edf), SPH_C32(0x664e8512),
        SPH_C32(0xbfba18c3), SPH_C32(0x7e715d17), SPH_C32(0xbc8d0000),
        SPH_C32(0xfc3b0018), SPH_C32(0x19830000), SPH_C32(0xd10b0000),
        SPH_C32(0xae1878c4), SPH_C32(0x42a69856), SPH_C32(0x0012da37),
        SPH_C32(0x2c3b504e)
    },
    {
        SPH_C32(0xbc8d0000), SPH_C32(0xfc3b0018), SPH_C32(0x19830000),
        SPH_C32(0xd10b0000), SPH_C32(0xae1878c4), SPH_C32(0x42a69856),
        SPH_C32(0x0012da37), SPH_C32(0x2c3b504e), SPH_C32(0xe8dd0000),
        SPH_C32(0xfa4a0044), SPH_C32(0x3c2d0000), SPH_C32(0xbb150000),
        SPH_C32(0x80bd361b), SPH_C32(0x24e81d44), SPH_C32(0xbfa8c2f4),
        SPH_C32(0x524a0d59)
    },
    {
        SPH_C32(0x69510000), SPH_C32(0xd4e1009c), SPH_C32(0xc3230000),
        SPH_C32(0xac2f0000), SPH_C32(0xe4950bae), SPH_C32(0xcea415dc),
        SPH_C32(0x87ec287c), SPH_C32(0xbce1a3ce), SPH_C32(0xc6730000),
        SPH_C32(0xaf8d000c), SPH_C32(0xa4c10000), SPH_C32(0x218d0000),
        SPH_C32(0x23111587), SPH_C32(0x7913512f), SPH_C32(0x1d28ac88),
        SPH_C32(0x378dd173)
    },
    {
        SPH_C32(0xc6730000), SPH_C32(0xaf8d000c), SPH_C32(0xa4c10000),
        SPH_C32(0x218d0000), SPH_C32(0x23111587), SPH_C32(0x7913512f),
        SPH_C32(0x1d28ac88), SPH_C32(0x378dd173), SPH_C32(0xaf220000),
        SPH_C32(0x7b6c0090), SPH_C32(0x67e20000), SPH_C32(0x8da20000),
        SPH_C32(0xc7841e29), SPH_C32(0xb7b744f3), SPH_C32(0x9ac484f4),
        SPH_C32(0x8b6c72bd)
    },
    {
        SPH_C32(0xcc140000), SPH_C32(0xa5630000), SPH_C32(0x5ab90780),
        SPH_C32(0x3b500000), SPH_C32(0x4bd013ff), SPH_C32(0x879b3418),
        SPH_C32(0x694348c1), SPH_C32(0xca5a87fe), SPH_C32(0x819e0000),
        SPH_C32(0xec570000), SPH_C32(0x66320280), SPH_C32(0x95f30000),
        SPH_C32(0x5da92802), SPH_C32(0x48f43cbc), SPH_C32(0xe65aa22d),
        SPH_C32(0x8e67b7fa)
    },
    {
        SPH_C32(0x819e0000), SPH_C32(0xec570000), SPH_C32(0x66320280),
        SPH_C32(0x95f30000), SPH_C32(0x5da92802), SPH_C32(0x48f43cbc),
        SPH_C32(0xe65aa22d), SPH_C32(0x8e67b7fa), SPH_C32(0x4d8a0000),
        SPH_C32(0x49340000), SPH_C32(0x3c8b0500), SPH_C32(0xaea30000),
        SPH_C32(0x16793bfd), SPH_C32(0xcf6f08a4), SPH_C32(0x8f19eaec),
        SPH_C32(0x443d3004)
    },
    {
        SPH_C32(0x78230000), SPH_C32(0x12fc0000), SPH_C32(0xa93a0b80),
        SPH_C32(0x90a50000), SPH_C32(0x713e2879), SPH_C32(0x7ee98924),
        SPH_C32(0xf08ca062), SPH_C32(0x636f8bab), SPH_C32(0x02af0000),
        SPH_C32(0xb7280000), SPH_C32(0xba1c0300), SPH_C32(0x56980000),
        SPH_C32(0xba8d45d3), SPH_C32(0x8048c667), SPH_C32(0xa95c149a),
        SPH_C32(0xf4f6ea7b)
    },
    {
        SPH_C32(0x02af0000), SPH_C32(0xb7280000), SPH_C32(0xba1c0300),
        SPH_C32(0x56980000), SPH_C32(0xba8d45d3), SPH_C32(0x8048c667),
        SPH_C32(0xa95c149a), SPH_C32(0xf4f6ea7b), SPH_C32(0x7a8c0000),
        SPH_C32(0xa5d40000), SPH_C32(0x13260880), SPH_C32(0xc63d0000),
        SPH_C32(0xcbb36daa), SPH_C32(0xfea14f43), SPH_C32(0x59d0b4f8),
        SPH_C32(0x979961d0)
    },
    {
        SPH_C32(0xac480000), SPH_C32(0x1ba60000), SPH_C32(0x45fb1380),
        SPH_C32(0x03430000), SPH_C32(0x5a85316a), SPH_C32(0x1fb250b6),
        SPH_C32(0xfe72c7fe), SPH_C32(0x91e478f6), SPH_C32(0x1e4e0000),
        SPH_C32(0xdecf0000), SPH_C32(0x6df80180), SPH_C32(0x77240000),
        SPH_C32(0xec47079e), SPH_C32(0xf4a0694e), SPH_C32(0xcda31812),
        SPH_C32(0x98aa496e)
    },
    {
        SPH_C32(0x1e4e0000), SPH_C32(0xdecf0000), SPH_C32(0x6df80180),
        SPH_C32(0x77240000), SPH_C32(0xec47079e), SPH_C32(0xf4a0694e),
        SPH_C32(0xcda31812), SPH_C32(0x98aa496e), SPH_C32(0xb2060000),
        SPH_C32(0xc5690000), SPH_C32(0x28031200), SPH_C32(0x74670000),
        SPH_C32(0xb6c236f4), SPH_C32(0xeb1239f8), SPH_C32(0x33d1dfec),
        SPH_C32(0x094e3198)
    },
    {
        SPH_C32(0xaec30000), SPH_C32(0x9c4f0001), SPH_C32(0x79d1e000),
        SPH_C32(0x2c150000), SPH_C32(0x45cc75b3), SPH_C32(0x6650b736),
        SPH_C32(0xab92f78f), SPH_C32(0xa312567b), SPH_C32(0xdb250000),
        SPH_C32(0x09290000), SPH_C32(0x49aac000), SPH_C32(0x81e10000),
        SPH_C32(0xcafe6b59), SPH_C32(0x42793431), SPH_C32(0x43566b76),
        SPH_C32(0xe86cba2e)
    },
    {
        SPH_C32(0xdb250000), SPH_C32(0x09290000), SPH_C32(0x49aac000),
        SPH_C32(0x81e10000), SPH_C32(0xcafe6b59), SPH_C32(0x42793431),
        SPH_C32(0x43566b76), SPH_C32(0xe86cba2e), SPH_C32(0x75e60000),
        SPH_C32(0x95660001), SPH_C32(0x307b2000), SPH_C32(0xadf40000),
        SPH_C32(0x8f321eea), SPH_C32(0x24298307), SPH_C32(0xe8c49cf9),
        SPH_C32(0x4b7eec55)
    },
    {
        SPH_C32(0x58430000), SPH_C32(0x807e0000), SPH_C32(0x78330001),
        SPH_C32(0xc66b3800), SPH_C32(0xe7375cdc), SPH_C32(0x79ad3fdd),
        SPH_C32(0xac73fe6f), SPH_C32(0x3a4479b1), SPH_C32(0x1d5a0000),
        SPH_C32(0x2b720000), SPH_C32(0x488d0000), SPH_C32(0xaf611800),
        SPH_C32(0x25cb2ec5), SPH_C32(0xc879bfd0), SPH_C32(0x81a20429),
        SPH_C32(0x1e7536a6)
    },
    {
        SPH_C32(0x1d5a0000), SPH_C32(0x2b720000), SPH_C32(0x488d0000),
        SPH_C32(0xaf611800), SPH_C32(0x25cb2ec5), SPH_C32(0xc879bfd0),
        SPH_C32(0x81a20429), SPH_C32(0x1e7536a6), SPH_C32(0x45190000),
        SPH_C32(0xab0c0000), SPH_C32(0x30be0001), SPH_C32(0x690a2000),
        SPH_C32(0xc2fc7219), SPH_C32(0xb1d4800d), SPH_C32(0x2dd1fa46),
        SPH_C32(0x24314f17)
    },
    {
        SPH_C32(0xa53b0000), SPH_C32(0x14260000), SPH_C32(0x4e30001e),
        SPH_C32(0x7cae0000), SPH_C32(0x8f9e0dd5), SPH_C32(0x78dfaa3d),
        SPH_C32(0xf73168d8), SPH_C32(0x0b1b4946), SPH_C32(0x07ed0000),
        SPH_C32(0xb2500000), SPH_C32(0x8774000a), SPH_C32(0x970d0000),
        SPH_C32(0x437223ae), SPH_C32(0x48c76ea4), SPH_C32(0xf4786222),
        SPH_C32(0x9075b1ce)
    },
    {
        SPH_C32(0x07ed0000), SPH_C32(0xb2500000), SPH_C32(0x8774000a),
        SPH_C32(0x970d0000), SPH_C32(0x437223ae), SPH_C32(0x48c76ea4),
        SPH_C32(0xf4786222), SPH_C32(0x9075b1ce), SPH_C32(0xa2d60000),
        SPH_C32(0xa6760000), SPH_C32(0xc9440014), SPH_C32(0xeba30000),
        SPH_C32(0xccec2e7b), SPH_C32(0x3018c499), SPH_C32(0x03490afa),
        SPH_C32(0x9b6ef888)
    },
    {
        SPH_C32(0x88980000), SPH_C32(0x1f940000), SPH_C32(0x7fcf002e),
        SPH_C32(0xfb4e0000), SPH_C32(0xf158079a), SPH_C32(0x61ae9167),
        SPH_C32(0xa895706c), SPH_C32(0xe6107494), SPH_C32(0x0bc20000),
        SPH_C32(0xdb630000), SPH_C32(0x7e88000c), SPH_C32(0x15860000),
        SPH_C32(0x91fd48f3), SPH_C32(0x7581bb43), SPH_C32(0xf460449e),
        SPH_C32(0xd8b61463)
    },
    {
        SPH_C32(0x0bc20000), SPH_C32(0xdb630000), SPH_C32(0x7e88000c),
        SPH_C32(0x15860000), SPH_C32(0x91fd48f3), SPH_C32(0x7581bb43),
        SPH_C32(0xf460449e), SPH_C32(0xd8b61463), SPH_C32(0x835a0000),
        SPH_C32(0xc4f70000), SPH_C32(0x01470022), SPH_C32(0xeec80000),
        SPH_C32(0x60a54f69), SPH_C32(0x142f2a24), SPH_C32(0x5cf534f2),
        SPH_C32(0x3ea660f7)
    },
    {
        SPH_C32(0x52500000), SPH_C32(0x29540000), SPH_C32(0x6a61004e),
        SPH_C32(0xf0ff0000), SPH_C32(0x9a317eec), SPH_C32(0x452341ce),
        SPH_C32(0xcf568fe5), SPH_C32(0x5303130f), SPH_C32(0x538d0000),
        SPH_C32(0xa9fc0000), SPH_C32(0x9ef70006), SPH_C32(0x56ff0000),
        SPH_C32(0x0ae4004e), SPH_C32(0x92c5cdf9), SPH_C32(0xa9444018),
        SPH_C32(0x7f975691)
    },
    {
        SPH_C32(0x538d0000), SPH_C32(0xa9fc0000), SPH_C32(0x9ef70006),
        SPH_C32(0x56ff0000), SPH_C32(0x0ae4004e), SPH_C32(0x92c5cdf9),
        SPH_C32(0xa9444018), SPH_C32(0x7f975691), SPH_C32(0x01dd0000),
        SPH_C32(0x80a80000), SPH_C32(0xf4960048), SPH_C32(0xa6000000),
        SPH_C32(0x90d57ea2), SPH_C32(0xd7e68c37), SPH_C32(0x6612cffd),
        SPH_C32(0x2c94459e)
    },
    {
        SPH_C32(0xe6280000), SPH_C32(0x4c4b0000), SPH_C32(0xa8550000),
        SPH_C32(0xd3d002e0), SPH_C32(0xd86130b8), SPH_C32(0x98a7b0da),
        SPH_C32(0x289506b4), SPH_C32(0xd75a4897), SPH_C32(0xf0c50000),
        SPH_C32(0x59230000), SPH_C32(0x45820000), SPH_C32(0xe18d00c0),
        SPH_C32(0x3b6d0631), SPH_C32(0xc2ed5699), SPH_C32(0xcbe0fe1c),
        SPH_C32(0x56a7b19f)
    },
    {
        SPH_C32(0xf0c50000), SPH_C32(0x59230000), SPH_C32(0x45820000),
        SPH_C32(0xe18d00c0), SPH_C32(0x3b6d0631), SPH_C32(0xc2ed5699),
        SPH_C32(0xcbe0fe1c), SPH_C32(0x56a7b19f), SPH_C32(0x16ed0000),
        SPH_C32(0x15680000), SPH_C32(0xedd70000), SPH_C32(0x325d0220),
        SPH_C32(0xe30c3689), SPH_C32(0x5a4ae643), SPH_C32(0xe375f8a8),
        SPH_C32(0x81fdf908)
    },
    {
        SPH_C32(0xb4310000), SPH_C32(0x77330000), SPH_C32(0xb15d0000),
        SPH_C32(0x7fd004e0), SPH_C32(0x78a26138), SPH_C32(0xd116c35d),
        SPH_C32(0xd256d489), SPH_C32(0x4e6f74de), SPH_C32(0xe3060000),
        SPH_C32(0xbdc10000), SPH_C32(0x87130000), SPH_C32(0xbff20060),
        SPH_C32(0x2eba0a1a), SPH_C32(0x8db53751), SPH_C32(0x73c5ab06),
        SPH_C32(0x5bd61539)
    },
    {
        SPH_C32(0xe3060000), SPH_C32(0xbdc10000), SPH_C32(0x87130000),
        SPH_C32(0xbff20060), SPH_C32(0x2eba0a1a), SPH_C32(0x8db53751),
        SPH_C32(0x73c5ab06), SPH_C32(0x5bd61539), SPH_C32(0x57370000),
        SPH_C32(0xcaf20000), SPH_C32(0x364e0000), SPH_C32(0xc0220480),
        SPH_C32(0x56186b22), SPH_C32(0x5ca3f40c), SPH_C32(0xa1937f8f),
        SPH_C32(0x15b961e7)
    },
    {
        SPH_C32(0x02f20000), SPH_C32(0xa2810000), SPH_C32(0x873f0000),
        SPH_C32(0xe36c7800), SPH_C32(0x1e1d74ef), SPH_C32(0x073d2bd6),
        SPH_C32(0xc4c23237), SPH_C32(0x7f32259e), SPH_C32(0xbadd0000),
        SPH_C32(0x13ad0000), SPH_C32(0xb7e70000), SPH_C32(0xf7282800),
        SPH_C32(0xdf45144d), SPH_C32(0x361ac33a), SPH_C32(0xea5a8d14),
        SPH_C32(0x2a2c18f0)
    },
    {
        SPH_C32(0xbadd0000), SPH_C32(0x13ad0000), SPH_C32(0xb7e70000),
        SPH_C32(0xf7282800), SPH_C32(0xdf45144d), SPH_C32(0x361ac33a),
        SPH_C32(0xea5a8d14), SPH_C32(0x2a2c18f0), SPH_C32(0xb82f0000),
        SPH_C32(0xb12c0000), SPH_C32(0x30d80000), SPH_C32(0x14445000),
        SPH_C32(0xc15860a2), SPH_C32(0x3127e8ec), SPH_C32(0x2e98bf23),
        SPH_C32(0x551e3d6e)
    },
    {
        SPH_C32(0x1e6c0000), SPH_C32(0xc4420000), SPH_C32(0x8a2e0000),
        SPH_C32(0xbcb6b800), SPH_C32(0x2c4413b6), SPH_C32(0x8bfdd3da),
        SPH_C32(0x6a0c1bc8), SPH_C32(0xb99dc2eb), SPH_C32(0x92560000),
        SPH_C32(0x1eda0000), SPH_C32(0xea510000), SPH_C32(0xe8b13000),
        SPH_C32(0xa93556a5), SPH_C32(0xebfb6199), SPH_C32(0xb15c2254),
        SPH_C32(0x33c5244f)
    },
    {
        SPH_C32(0x92560000), SPH_C32(0x1eda0000), SPH_C32(0xea510000),
        SPH_C32(0xe8b13000), SPH_C32(0xa93556a5), SPH_C32(0xebfb6199),
        SPH_C32(0xb15c2254), SPH_C32(0x33c5244f), SPH_C32(0x8c3a0000),
        SPH_C32(0xda980000), SPH_C32(0x607f0000), SPH_C32(0x54078800),
        SPH_C32(0x85714513), SPH_C32(0x6006b243), SPH_C32(0xdb50399c),
        SPH_C32(0x8a58e6a4)
    },
    {
        SPH_C32(0x033d0000), SPH_C32(0x08b30000), SPH_C32(0xf33a0000),
        SPH_C32(0x3ac20007), SPH_C32(0x51298a50), SPH_C32(0x6b6e661f),
        SPH_C32(0x0ea5cfe3), SPH_C32(0xe6da7ffe), SPH_C32(0xa8da0000),
        SPH_C32(0x96be0000), SPH_C32(0x5c1d0000), SPH_C32(0x07da0002),
        SPH_C32(0x7d669583), SPH_C32(0x1f98708a), SPH_C32(0xbb668808),
        SPH_C32(0xda878000)
    },
    {
        SPH_C32(0xa8da0000), SPH_C32(0x96be0000), SPH_C32(0x5c1d0000),
        SPH_C32(0x07da0002), SPH_C32(0x7d669583), SPH_C32(0x1f98708a),
        SPH_C32(0xbb668808), SPH_C32(0xda878000), SPH_C32(0xabe70000),
        SPH_C32(0x9e0d0000), SPH_C32(0xaf270000), SPH_C32(0x3d180005),
        SPH_C32(0x2c4f1fd3), SPH_C32(0x74f61695), SPH_C32(0xb5c347eb),
        SPH_C32(0x3c5dfffe)
    },
    {
        SPH_C32(0x01930000), SPH_C32(0xe7820000), SPH_C32(0xedfb0000),
        SPH_C32(0xcf0c000b), SPH_C32(0x8dd08d58), SPH_C32(0xbca3b42e),
        SPH_C32(0x063661e1), SPH_C32(0x536f9e7b), SPH_C32(0x92280000),
        SPH_C32(0xdc850000), SPH_C32(0x57fa0000), SPH_C32(0x56dc0003),
        SPH_C32(0xbae92316), SPH_C32(0x5aefa30c), SPH_C32(0x90cef752),
        SPH_C32(0x7b1675d7)
    },
    {
        SPH_C32(0x92280000), SPH_C32(0xdc850000), SPH_C32(0x57fa0000),
        SPH_C32(0x56dc0003), SPH_C32(0xbae92316), SPH_C32(0x5aefa30c),
        SPH_C32(0x90cef752), SPH_C32(0x7b1675d7), SPH_C32(0x93bb0000),
        SPH_C32(0x3b070000), SPH_C32(0xba010000), SPH_C32(0x99d00008),
        SPH_C32(0x3739ae4e), SPH_C32(0xe64c1722), SPH_C32(0x96f896b3),
        SPH_C32(0x2879ebac)
    },
    {
        SPH_C32(0x5fa80000), SPH_C32(0x56030000), SPH_C32(0x43ae0000),
        SPH_C32(0x64f30013), SPH_C32(0x257e86bf), SPH_C32(0x1311944e),
        SPH_C32(0x541e95bf), SPH_C32(0x8ea4db69), SPH_C32(0x00440000),
        SPH_C32(0x7f480000), SPH_C32(0xda7c0000), SPH_C32(0x2a230001),
        SPH_C32(0x3badc9cc), SPH_C32(0xa9b69c87), SPH_C32(0x030a9e60),
        SPH_C32(0xbe0a679e)
    },
    {
        SPH_C32(0x00440000), SPH_C32(0x7f480000), SPH_C32(0xda7c0000),
        SPH_C32(0x2a230001), SPH_C32(0x3badc9cc), SPH_C32(0xa9b69c87),
        SPH_C32(0x030a9e60), SPH_C32(0xbe0a679e), SPH_C32(0x5fec0000),
        SPH_C32(0x294b0000), SPH_C32(0x99d20000), SPH_C32(0x4ed00012),
        SPH_C32(0x1ed34f73), SPH_C32(0xbaa708c9), SPH_C32(0x57140bdf),
        SPH_C32(0x30aebcf7)
    },
    {
        SPH_C32(0xee930000), SPH_C32(0xd6070000), SPH_C32(0x92c10000),
        SPH_C32(0x2b9801e0), SPH_C32(0x9451287c), SPH_C32(0x3b6cfb57),
        SPH_C32(0x45312374), SPH_C32(0x201f6a64), SPH_C32(0x7b280000),
        SPH_C32(0x57420000), SPH_C32(0xa9e50000), SPH_C32(0x634300a0),
        SPH_C32(0x9edb442f), SPH_C32(0x6d9995bb), SPH_C32(0x27f83b03),
        SPH_C32(0xc7ff60f0)
    },
    {
        SPH_C32(0x7b280000), SPH_C32(0x57420000), SPH_C32(0xa9e50000),
        SPH_C32(0x634300a0), SPH_C32(0x9edb442f), SPH_C32(0x6d9995bb),
        SPH_C32(0x27f83b03), SPH_C32(0xc7ff60f0), SPH_C32(0x95bb0000),
        SPH_C32(0x81450000), SPH_C32(0x3b240000), SPH_C32(0x48db0140),
        SPH_C32(0x0a8a6c53), SPH_C32(0x56f56eec), SPH_C32(0x62c91877),
        SPH_C32(0xe7e00a94)
    }
};

#define INPUT_BIG   do { \
        __constant const sph_u32 *tp = &T512[0][0]; \
        unsigned u, v; \
        m0 = 0; \
        m1 = 0; \
        m2 = 0; \
        m3 = 0; \
        m4 = 0; \
        m5 = 0; \
        m6 = 0; \
        m7 = 0; \
        m8 = 0; \
        m9 = 0; \
        mA = 0; \
        mB = 0; \
        mC = 0; \
        mD = 0; \
        mE = 0; \
        mF = 0; \
        for (u = 0; u < 8; u ++) { \
            unsigned db = buf(u); \
            for (v = 0; v < 8; v ++, db >>= 1) { \
                sph_u32 dm = SPH_T32(-(sph_u32)(db & 1)); \
                m0 ^= dm & *tp ++; \
                m1 ^= dm & *tp ++; \
                m2 ^= dm & *tp ++; \
                m3 ^= dm & *tp ++; \
                m4 ^= dm & *tp ++; \
                m5 ^= dm & *tp ++; \
                m6 ^= dm & *tp ++; \
                m7 ^= dm & *tp ++; \
                m8 ^= dm & *tp ++; \
                m9 ^= dm & *tp ++; \
                mA ^= dm & *tp ++; \
                mB ^= dm & *tp ++; \
                mC ^= dm & *tp ++; \
                mD ^= dm & *tp ++; \
                mE ^= dm & *tp ++; \
                mF ^= dm & *tp ++; \
            } \
        } \
    } while (0)

#define INPUT_BIG_LOCAL   do { \
        __local sph_u32 *tp = &(T512_L[0]); \
        unsigned u, v; \
        m0 = 0; \
        m1 = 0; \
        m2 = 0; \
        m3 = 0; \
        m4 = 0; \
        m5 = 0; \
        m6 = 0; \
        m7 = 0; \
        m8 = 0; \
        m9 = 0; \
        mA = 0; \
        mB = 0; \
        mC = 0; \
        mD = 0; \
        mE = 0; \
        mF = 0; \
        for (u = 0; u < 8; u ++) { \
            unsigned db = buf(u); \
            for (v = 0; v < 8; v ++, db >>= 1) { \
                sph_u32 dm = SPH_T32(-(sph_u32)(db & 1)); \
                m0 ^= dm & *tp ++; \
                m1 ^= dm & *tp ++; \
                m2 ^= dm & *tp ++; \
                m3 ^= dm & *tp ++; \
                m4 ^= dm & *tp ++; \
                m5 ^= dm & *tp ++; \
                m6 ^= dm & *tp ++; \
                m7 ^= dm & *tp ++; \
                m8 ^= dm & *tp ++; \
                m9 ^= dm & *tp ++; \
                mA ^= dm & *tp ++; \
                mB ^= dm & *tp ++; \
                mC ^= dm & *tp ++; \
                mD ^= dm & *tp ++; \
                mE ^= dm & *tp ++; \
                mF ^= dm & *tp ++; \
            } \
        } \
    } while (0)

#endif
