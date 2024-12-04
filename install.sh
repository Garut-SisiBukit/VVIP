#!/bin/bash
#
# This file encrypted at Wed 04 Dec 2024 07:50:22 PM WIB by
# +------------------------------------------------------+
# | Author: RMBL VPN                                   |
# | Reguon: Indonesia ( Asia Tenggara )                  |
# | Chanel: https://t.me/ |
# +------------------------------------------------------+
# Don't forget follow me on:
# -  https://github.com/R
# Sponsor this project:
# -  https://t.me/RMBL
# -  http://vps-ku.my.id

skip=70
tab='	'
nl='
'
IFS=" $tab$nl"

# Ensure critical variables are present, especially when not defined by login(1)
# Note: $USER may not always be executed (e.g., in containers)
# Copyrighted code by @Rmblvpn / rmbl@rmblv.my.id
USER=${USER:-$(id -u -n)}
# Ensure critical variables are present, especially when not defined by login(1)
# Note: $USER may not always be executed (e.g., in containers)
# Copyrighted code by @Rmblvpn / rmbl@rmblv.my.id
HOME="${HOME:-$(getent passwd $USER 2>/dev/null | cut -d: -f6)}"
# PC does not have getent, but this works even if $HOME is unset
HOME="${HOME:-$(eval echo ~$USER)}"
umask=`umask`
umask 77

shctmpdir=
trap 'res=$?
  test -n "$shctmpdir" && rm -fr "$shctmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | */tmp/) test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  */tmp) TMPDIR=$TMPDIR/; test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  *:* | *) TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
esac
if type mktemp >/dev/null 2>&1; then
  shctmpdir=`mktemp -d "${TMPDIR}shctmpXXXXXXXXX"`
else
  shctmpdir=${TMPDIR}shctmp$$; mkdir $shctmpdir
fi || { (exit 127); exit 127; }

shctmp=$shctmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$shctmp" && rm -r "$shctmp";;
*/*) shctmp=$shctmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gpg -q --decrypt --batch --passphrase "Anjay password nya mana 😂😂😂😂😂😂😂😂 Rasenggan (Ah lupa ga ada emot Rasenggan) pakai api aja dah 🔥🔥🔥 menyala abangkuh | mn:6t:Kl:bm:GF:qX:2b:JR:MG:yc:RT:Fy:sJ:yu:1o:Y8:Xi:hI:Gs:Q8:7P:9C:xg:6G:3Z:yG:al:2t:DM:6o:RR:Xc:gu:JW:5N:yf:Mm:On:tu:au:RE:hV:GB:Rn:Zi:d4:M2:Rk:7k:zM:kI:s4:mx:69:V6:rM:ja:pC:6m:4b:a1:EQ:dY:AG:LL:5S:WE:KT:yX:D0:RS:2t:Xb:u1:P4:wI:w5:1B:jY:ja:fU:oV:Sk:Mj:J0:qE:Zl:oz:TP:Xw:b3:au:Pu:TN:x3:3z:FP:A3:2R:st:sw:zL:RL:xJ:wd:Wy:yb:Li:cz:SN:pJ:Zu:Mh:CU:3W:Bk:Gy:Gh:BC:wG:Zi:4O:YF:vH:PW:LK:73:8l:kg:9x:d0:HF:xT:7n:pQ:fq:5M:me:5Z:tX:4v:Bj:rx:tV:f4:2k:UW:mE:3B:m1:ay:ZB:aX:9Y:cI:px:KV:Mt:VQ:oz:yy:Vi:yZ:jj:jO:zI:a4:UH:N5:SZ:ci:P6:oS:aa:kY:TF:AE:Ox:H8:Ef:To:TZ:zk:02:bE:YT:Y3:S8:Jc:wV:Cb:Bg:X9:8w:M7:p9:8i:LG:Bh:Gm:WF:UB:it:n2:3S:FY:qC:pw:jY:EH:Me:2K:B3:6W:xv:5a:ud:0y:c0:vU:HU:Tg:ls:pp:91:Zv:eY:pV:0i:PR:6S:En:nP:km:9d:Tu:Im:Ww:5l:kW:Uy:hU:HG:4H:ob:j3:dm:9K:pa:EV:Bc:g1:6B:i8:gI:V2:P2:6D:g4:sZ:WO:v6:py:e0:CO:bv:JM:l9:ja:Cf:sn:ar:bQ:P5:Fe:JY:rL:sn:gt:VL:Sm:yn:wn:cx:g2:XD:sl:i2:K3:LL:FP:6j:tO:OJ:Kp:uZ:Ke:9m:7m:k4:pQ:sP:ZI:HC:lF:k1:jq:Gb:PM:Vp:z5:Ba:Ai:hz:Wo:LX:H3:86:Eo:1h:PW:6X:ZX:An:Dx:j6:4x:iA:CO:LS:y3:ZK:xF:1B:Qz:jK:BV:02:02:xk:4L:Vu:xd:Ma:nr:v7:ea:tt:Mp:Pj:kg:El:9F:6M:Zz:mR:1e:Uh:MV:oj:2C:iL:fx:M1:JI:2U:rl:3f:wz:Lk:pf:On:sS:0R:xx:Py:V6:qv:51:hq:AP:ac:1q:uJ:TP:rk:i8:wI:wZ:kL:sa:Bi:i9:0V:Ni:o2:Mp:MT:qq:aO:GQ:7n:KJ:G5:Hs:Ab:Pq:15:Yd:Td:CL:QE:FI:YQ:Ch:Em:4B:oW:Bw:MB:WK:21:BS:xK:fv:aB:W4:kx:F9:0b:GF:j3:3p:E3:JK:ah:2j:jC:7F:ga:yp:fg:Xd:dy:6x:r0:TK:Af:Qp:wt:IQ:02:Ac:Cu:hp:FI:XT:AM:di:nQ:En:tt:xa:78:cP:Z8:AM:Qn:T8:Ce:np:Hk:lL:Mw:r3:Yx:Ap:5g:jr:zQ:Qp:Vg:mo:MU:0h:e7:Pg:x7:W7:gY:GI:9B:WV:Gi:Ey:GD:wQ:vP:EL:CK:7L:EV:cI:ev:ge:z9:7w:MY:iw:nu:pc:6a:Vd:Tz:Wd:iK:xP:rM:xj:hr:l6:ZP:BI:kS:Ag:EH:kr:Eh:cV:Mf:Xx:yD:uQ:Yy:Ta:yo:zz:Q0:kU:e8:gM:Lo:KL:11:E7:O3:fL:cP:rV:yT:o8:3n:Hb:PN:Yq:kP:S3:ba:Fg:0z:qt:HO:Ri:aF:1c:T6:4c:kw:nT:S8:o3:GV:5k:60:03:Gg:rs:dc:Wv:yt:hw:zr:Xq:kM:XS:jg:Li:C5:jQ:9g:Bm:d3:iD:SV:NI:f4:DT:YA:Xc:IP:dn:Lm:Re:Gs:sc:Qb:M4:I0:5M:5g:Ju:uV:tW:1l:uC:rg:BP:Zt:MO:ih:oV:u0:UX:Ng:2m:Zd:UL:yf:jv:t6:qc:Ds:mn:Ly:gA:27:R0:b2:wN:o9:oI:hv:67:xg:12:SP:qh:CJ:lr:6v:Il:hA:hb:iG:sz:Xb:hx:lL:vF:lf:g1:qO:EZ:oO:bu:YY:ae:aY:Y2:ao:D4:rh:cH:Uz:kp:sV:dZ:OU:V9:JT:ip:Kv:EV:lc:j3:z3:YW:BL:DT:7Y:3z:io:LE:Tm:4z:Fr:rX:Zf:ZL:wf:sI:BZ:Aw:t8:8k:Yq:7S:Ms:vu:JG:0G:HZ:KH:Sr:VH:yY:JS:Fn:ir:PQ:D4:w4:xY:KU:zm:hN:5O:AR:I4:7W:hT:iP:xe:G2:uq:Bm:4z:EN:Af:pt:9r:4Y:1V:wL:BL:rm:Te:dZ:se:Hm:wZ:cL:QL:ui:Ds:eA:pK:0M:B5:9u:pB:c5:CP:q0:HS:ep:5Q:Ke:Zc:3v:AA:p6:aN:Qd:jf:Gr:FL:Pp:u7:KB:hI:kb:2B:Kp:uZ:Tx:WJ:0u:s3:mU:I9:U6:8X:Ng:ho:Jh:iB:45:p0:kf:cr:5S:Jy:fq:ME:kF:QE:0o:p9:nc:W5:rL:Lp:PC:pt:hJ:LR:Uy:JE:S1:fW:Vj:PU:ke:ID:2f:zV:xJ:xl:2s:yC:Rv:WQ:vH:ok:Pc:9O:98:Xp:g9:sj:ej:21:8G:2Q:0Z:po:3o:oI:jq:wf:y8:4Y:4g:Hr:qr:R1:Ex:By:Z7:NQ:sG:aF:A2:FA:cK:1X:Fk:qY:nC:bh:p4:us:HQ:9f:9N:2m:g7:2Q:xF:CI:7Y:x8:6b:SO:cR:lK:og:Gw:Jj:2s:uD:54:9U:uq:UD:aB:XU:cw:M2:Ew:kw:mM:LT:Ps:v4:SZ:7z:3S:Xt:nj:0C:2u:Cs:nh:Rb:3V:Fr:es:KB:EJ:25:v5:8i:ON:74:U4:an:ul:YO:Wd:pt:p1:Jb:SF:pk:y1:n4:Px:eH:Ce:ZN:OI:Xs:Uj:a7:jg:uo:Ye:Ng:Nb:p4:z3:ri:gj:qO:S6:LF:I8:O3:2x:RK:cp:0s:Uc:il:Ea:8m:t0:Sl:4T:kE:Ij:4R:Gj:8A:5V:pv:kF:n7:y7:nd:s7:ye:nH:eV:6B:Vt:9K:DW:Uw:hp:pD:E7:wS:AO:2c:Wc:Ov:va:pQ:YE:SC:Z2:8z:Z5:CN:vc:f5:fi:KD:xh:KR:ju:5S:9M:j4:Gy:bx:Y6:34:EK:9d:Pr:qk:XL:tU:SJ:QG:q2:9v:1h:cT:ya:OM:mE:bL:mv:2m:np:N8:FA:NE:gf:Ch:Zm:kn:rr:9q:J9:IF:Z3:5N:IL:6W:72:jG:Dk:Qu:Gm:Gi:OQ:m2:43:ep:Zi:r7:MJ:ZD:zs:po:o8:Ak:8t:fP:6i:v9:oN:pS:om:rJ:HF:Vu:HO:XQ:QG:Xi:q3:gF:8Z:pr:r6:Q6:YX:NI:l5:DP:6c:tH:M4:YD:Yx:hz:a4:8N:kH:bY:6T:ml:pU:FQ:mL:Ve:X0:RD:gs:Px:4l:ql:8V:zM:wM:Fd:cx:Ty:uN:r0:fr:G7:lJ:hM:Xn:Q0:X2:Re:Dq:aN:K9:P2:Ch:WR:5E:BB:ku:Tb:ZW:7n:yg:Uz:MM:qQ:Px:s2:mC:dF:zF:1s:pr:Oa:XL:jQ:Oi:VA:h5:oB:hh:NA:bs:uE:ka:VM:4U:2C:zo:nu:5T:g6:Ue:ON:H9:R4:DA:Vd:Se:94:Ky:md:ej:kN:Xc:JD:tA:pW:ey:Td:ob:4T:fe:Dq:i9:mN:MG:wc:bJ:jH:HM:GW:O8:eW:W3:WT:aC:ek:TB:5b:AZ:pf:LC:85:5P:m6:HY:CI:xz:sx:0M:Ez:2o:o0:1x:Qt:AH:2M:xP:81:W2:4H:Rr:qj:Xd:eT:AH:BU:wn:9M:wF:Y5:BC:mx:G7:7K:Vs:1i:6D:dH:L6:6U:sp:Y9:Rz:Kk:lw:Z8:ow:3Q:b6:xT:jE:uT:M1:rn:fF:EE:CF:aP:vT:6e:Sq:86:x8:7M:sR:cW:js:tQ:FA:5W:HR:G3:Bb:Qq:MF:BD:R1:tU:pm:te:jm:TB:P4:r6:ps:WH:cl:lO:Qz:wY:s2:BX:PL:Tr:hK:7N:QV:iG:JQ:kW:oL:9t:vE:FW:u5:XX:IF:ff:4N:bP:n5:U2:bM:qr:UC:5q:ZL:wP:O8:hV:h9:PG:6M:tq:aZ:4K:yy:U0:sH:D5:x4:2T:tz:nR:kn:FX:xS:W5:Up:AP:Mh:lR:9O:UH:Zv:Wj:iz:6K:cR:Fv:Zy:JE:Z1:ib:zk:8C:Hl:Xg:Iq:ih:24:gE:rX:qb:rw:jb:us:LA:1s:T6:Di:mc:yZ:8A:rW:Ob:Yk:83:bV:48:Te:GT:GD:EA:wC:Hk:KX:QM:6e:K6:w4:d4:M4:pF:cK:uW:6p:bD:RY:Hl:LP:0N:mW:5P:FD:1D:ON:pt:bs:Gd:a9:f5:zN:PK:vQ:LN:Rr:bE:2t:qP:TQ:nT:gM:4m:ac:Jj:Lh:HZ:jY:28:Xs:bk:La:Mn:KX:YI:Jj:4T:Id:yv:AK:4m:c6:Of:p4:DG:Qn:ap:0A:uP:Xc:tG:2s:UV:Gc:QY:Bh:uS:Vx:ld:tE:PD:jX:cB:jn:0d:y0:EI:9I:bF:2r:cm:wy:dM:LF:Cb:wg:rn:pF:3A:C9:2Z:8W:Tq:g1:BJ:kW:s1:JN:Ai:il:Ke:Lg:ME:jK:we:wh:bv:4X:ZG:xc:Ck:Rj:iY:Em:Am:uD:3B:Bc:76:8W:SQ:SE:Xb:b1:Z8:O7:nN:tr:N9:Fs:Uq:9k:OY:Zo:mm:jr:Xm:oO:q0:wl:dq:ly:ga:SS:vi:rs:w7:rV:9C:G6:sa:uC:oV:Tq:aB:Jd:lm:gT:8a:KN:Rf:Bx:Qx:Nv:Le:QQ:7g:Om:eT:kR:qa:UR:EV:D5:X9:CP:ib:nB:Hq:tR:QH:jc:nJ:6l:v8:SO:aZ:YR:Z6:51:Un:OT:PM:Fg:L8:ZI:bW:kR:Ub:I0:pv:0N:tT:qT:57:CF:Vh:uQ:Av:eE:0c:Q8:WE:Bm:IB:5c:JC:un:f0:T7:Ta:VC:8p:p8:RO:i8:sK:tS:1l:rA:re:nj:xn:2B:z6:Hy:pS:kt:4l:5I:tn:n4:wy:RJ:pT:WR:Su:nx:y9:Ti:j5:Yu:eV:HB:7t:1T:re:Un:AJ:ND:KU:YE:JZ:jO:Yi:6l:9m:Pb:34:Y7:4C:aE:Ku:eM:K0:nj:Ch:PA:sb:Sk:bm:Do:Y9:HL:nG:3O:HQ:CC:bM:Si:cY:ZZ:9C:8H:1t:5F:4v:EN:Ux:qE:IL:T3:9F:SC:KR:oG:qi:Aa:MV:jv:hh:T7:L2:jp:3u:rl:k8:I2:D6:gF:h5:e8:Ff:lr:sO:WV:AM:6o:yY:qn:mL:A2:Gk:oH:tz:3o:Zk:Nc:cW:V8:G3:vv:Md:lW:mo:xN:69:T3:PM:9n:Fg:VH:d0:rj:yh:zA:xL:00:yk:y4:2R:XO:rG:aw:fU:hb:oB:G3:Od:L6:xr:5u:f6:Ul:zG:J8:V3:XX:8o:nd:Sz:Oo:K8:ks:Fi:db:9w:zz:qW:Jd:su:GZ:I7:D2:nx:ch:5L:KG:ax:1P:RI:0a:Dd:j4:F3:le:Aj:WJ:Bp:5h:NQ:n1:UC:eb:9j:8X:SD:YK:sc:DC:YP:1x:9P:aR:LR:HX:vr:Cd:Y6:y1:aK:XT:lY:Rc:Z6:6D:q8:Um:LO:Kz:yD:mn:Ae:ad:1v:AE:zx:tG:TE:Pn:Jk:O1:jU:jt:wF:18:WQ:Cj:W3:mc:k2:4H:oy:zV:5z:99:zs:Gi:zE:5p:cZ:4F:Ut:Uo:Op:aS:v6:Ow:qR:hG:BC:K0:yT:Cl:4V:JJ:P4:rp:m8:Ui:23:u5:KE:8c:7E:lp:cV:pu:RI:r5:Mm:O8:2q:n2:Je:wm:jV:hw:9P:F6:Ms:CC:F3:q1:MX:2Q:LD:wa:qQ:Ad:Cb:qm:Ve:7Q:rR:iU:uX:S0:jd:UM:A2:gt:v9:C8:xD:ES:Fu:9f:Gl:6B:x9:fR:7d:Np:w9:2X:r6:vz:GN:lh:c3:eG:4o:1F:KA:lA:Bu:W3:dN:rD:M6:GV:9t:97:mt:Y1:V6:cf:fn:m7:Mt:R5:un:oJ:o0:KQ:MO:0C:Dp:nj:7G:Fm:Zg:6F:eO:Mp:Bd:iQ:E3:YR:fy:qB:zr:Il:MI:Xj:te:hg:rY:hn:F7:ad:z0:Ut:0Y:f0:L0:a8:AV:NZ:jN:Cd:lO:Es:MN:fe:xk:M2:RU:yh:w8:51:bj:mT:a1:kE:sJ:5u:q4:Kv:6R:U3:wV:10:tC:ZE:JE:SY:5E:Ke:tI:YW:CX:Ha:RJ:a3:wa:b2:l9:P9:8E:AS:4g:3I:aB:mb:AQ:rG:Qj:kX:n2:IJ:tR:SO:Y8:tA:Bp:sw:3e:Gx:E1:9t:bF:W7:8p:Y1:im:1N:9M:Uv:La:qi:IM:vG:dU:JL:vB:E2:FB:Ja:s0:bg:5T:8W:3y:WM:mU:8X:OL:9S:FL:1h:6C:kC:z5:nF:0x:i1:RN:2j:VA:8L:Ya:63:TY:Ef:7m:00:VQ:Bi:3j:2N:aL:5e:6y:lA:xw:fN:fV:8G:2u:EV:xo:vB:zz:2X:WT:0z:sq:YR:Tv:cx:Qa:pX:IP:C5:v3:fa:5O:fh:GU:0Z:Vy:Ar:6u:wA:Yz:X8:Q8:b3:KX:jK:Np:oY:2b:y8:DJ:GK:VC:S7:nD:ZL:hq:jy:Xn:EM:qL:uw:ur:bJ:ag:Pu:dr:gS:lP:Qd:4s:Qs:Hs:vD:O0:zJ:ND:1D:sY:UG:6y:7U:jL:G1:xW:zk:Hk:xA:fU:Mm:24:Ie:z0:Hb:B0:Nj:hp:Gk:EO:BX:NB:ol:e9:7X:3Q:gl:vh:5R:gS:nr:Mo:C7:LB:Nv:7o:IH:UO:gv:yq:B6:rL:GH:hx:CC:KT:hL:zJ:WV:XK:X6:Hh:hn:AG:GP:wL:9p:F5:Ss:eB:LU:Ag:bi:vO:T9:VJ:y7:0L:fv:4L:1k:Em:pe:oB:wL:zs:7m:bU:aX:IZ:hT:Rl:xd:5v:lS:nr:rQ:rA:m2:AS:AG:rz:kn:0O:Ly:NK:9U:ET:Im:BP:iU:0D:FT:qA:lJ:YL:oP:x4:IY:EY:Pt:af:OG:Tb:44:bc:DH:Fu:jM:y0:U4:dK:0M:2l:38:tc:IZ:7K:1o:B3:Ws:Yn:s1:kA:Rl:LF:IK:KA:sS:gr:Xv:qT:IE:Hl:LC:tG:HY:FJ:qD:kl:Ia:2r:44:lz:dq:c3:7H:96:pL:tx:bp:nn:zq:1W:dG:m9:CG:fv:iM:4P:g7:Cz:m9:f8:Qd:XY:8Y:Ht:Nj:bX:1h:ng:0z:FM:pb:kz:Wu:wc:hK:oV:Ld:A2:f4:wC:q8:7X:4y:GR:FH:kJ:UN:cy:m6:KA:3d:L5:RH:hH:aS:Z5:5X:8V:WY:m5:hr:xb:QN:vL:6Z:2f:2j:O1:Lu:jE:OG:E3:vN:Mn:JJ:qQ:pt:Zk:DS:qp:0V:AD:MR:9K:bG:c4:Dq:yw:ps:hn:wp:MG:jM:RQ:qe:BT:CN:nA:WK:46:bt:8T:wt:hM:Bt:Sr:38:5y:6T:rC:Ki:BO:1z:as:5H:Ez:uc:LV:XG:Ol:7H:7l:A1:tQ:us:9T:qR:d4:4T:1k:ic:Hj:Ck:XD:F6:C0:W5:93:IX:9T:9V:MZ:Il:6h:u2:ek:GJ:jY:zi:yr:Bz:9K:ZN:0v:Eg:F3:Dq:3L:ON:Fw:N6:5R:m2:37:pw:FS:az:j9:vn:LW:Jh:nR:40:hg:6B:Kd:XG:zg:5U:Br:jx:gW:W0:Lk:tZ:zN:Il:4i:XO:jq:ZE:9G:8D:Rn:XK:z1:IR:E3:ib:lH:F6:6v:T4:em:LP:hA:I6:we:vw:qe:C8:eR:nL:dM:Rl:Mu:zt:1L:c6:zg:eI:4p:pW:g0:3n:Fp:wI:bA:FO:XE:4w:2u:Oy:3n:gD:nG:N5:ym:WU:Dz:Ck:2d:z8:dT:Vs:ff:sB:6R:ra:t5:CX:OT:Bq:J9:Vc:ZQ:4A:UP:MA:GT:Uc:jF:qn:w0:lx:hi:qS:vu:ch:nR:Sk:1c:hw:3k:jb:tB:JZ:r3:3f:FK:aY:m8:jH:7U:Ja:lW:KR:Da:NG:Nv:wc:HQ:qD:ie:Up:bJ:LU:BA:D7:EF:v1:Md:cE:s6:xk:u7:IF:Uo:Ly:hM:Eo:xT:P4:kD:sR:bT:Yn:pF:1h:ft:cm:ru:8s:oT:0C:ZG:WW:cm:24:XC:bm:sL:vs:41:yF:Fg:eQ:YD:wC:LG:yN:sj:i9:ms:pS:GA:TZ:KM:Pi:f7:4r:lY:Fk:JT:6x:dr:JH:R3:ZD:w0:t2:yY:Tc:nu:hB:OF:AQ:kg:jm:42:bU:gq:oR:Os:OB:LC:k6:37:rP:3k:oo:dr:3h:gR:xG:IM:Jj:Sg:fL:9V:We:X8:dA:tc:RN:Ht:bV:fK:Zq:Fq:5E:wf:Xp:fX:I3:XT:qo:5Y:Qh:kC:KF:MJ:kN:qU:K3:kr:bF:qV:gg:b7:jA:Cu:A3:1S:Ni:y7:Xv:kF:I3:qb:DK:Vp:Xn:Nc:eF:z2:xN:ma:1O:kR:sU:Lx:eg:1s:oK:ar:w5:nZ:nx:Es:2s:yT:4t:7M:lh:Hq:Lp:WR:Uz:ck:WS:P5:Ea:Sr:sj:i8:8F:sG:Di:IQ:Yf:IO:Uh:Ph:ja:VX:iZ:86:yM:yB:t0:Ut:57:E2:bs:eT:Yn:3b:EB:Vc:wy:R3:Zk:gF:1J:Ef:ZA:5f:j1:P7:bW:p5:5K:kq:7k:XW:fK:zU:Ds:Kc:li:e5:Nx:E1:cT:TL:WU:F3:LJ:ut:hT:H5:6H:rN:qL:ar:H0:go:JK:6M:Ia:TX:Z1:pX:ly:Ya:Ee:Yc:Eq:E6:00:nU:VE:AE:pl:cS:QW:cB:P1:lN:wJ:cD:Gw:Kj:FN:cI:A4:mW:ET:5h:dS:Ed:HW:x7:dL:wz:oN:Yy:7Q:WZ:wh:Ld:Pw:gK:dy:nU:sM:O4:n0:J2:y1:z9:Vp:or:kd:El:u1:6M:Ay:R4:iN:ug:Y9:ha:7C:vc:4O:0v:GW:JN:vK:IS:tj:Xy:p9:W0:Hr:UU:Hj:ua:Ve:qO:DG:MZ:Le:jt:fN:iV:PA:vs:1v:z5:m9:Ip:Ae:Av:Py:Gc:15:Dp:CF:3k:IA:gS:5f:CF:62:uf:tL:6j:f0:KI:8h:g4:Lw:YN:kg:jC:M7:ax:ws:ym:yq:kW:wq:JR:hp:pr:Sl:9B:5L:m3:rv:kN:fP:aJ:8L:0U:an:7p:gr:4K:l4:Pb:E2:uF:9T:Ib:zi:e5:KD:5O:EE:Qq:XX:JZ:hr:Hq:fk:RC:q0:Fs:tT:tF:xL:TP:LP:CV:hR:Vk:Uq:xD:GD:fu:Z5:WS:aZ:aj:Ff:pd:Gx:f7:pQ:KH:vr:vr:AZ:gK:9j:ko:HA:NZ:fX:Ai:GA:82:Px:oY:LM:yN:BV:bY:qo:OG:iF:ix:jZ:LU:8K:6J:SK:r3:HG:va:Yh:Cg:6j:cE:H4:90:cX:QS:OO:lW:Oh:9V:CB:R8:bq:vd:iJ:uF:NV:d3:6D:rj:k2:RF:XK:Ot:bW:mc:Pk:WA:en:5A:lP:oY:gs:3f:q3:1h:Lw:WR:td:0N:sY:Uo:1b:q0:vS:6L:aC:y8:Nw:Xc:RA:tV:CC:4t:uu:Zf:cO:vg:XG:FL:A1:zL:Vp:Ay:bs:wn:Wh:cZ:sI:Bz:D5:G7:en:UV:tN:0I:vi:GL:t1:ml:vo:G4:jU:ge:Ts:PR:Ut:Qb:Wj:WN:Ok:R6:s7:3j:d5:5v:mH:oQ:kl:kf:gy:gV:vZ:n5:b6:jZ:gU:AM:48:BW:65:b1:x3:IR:Pi:eI:Yt:p3:wq:Ds:2C:Yl:Ng:Pi:fO:MJ:Qy:cN:al:2R:sV:Mf:gn:5Q:kI:Ev:P3:QZ:x7:v6:aG:bN:3h:A7:Qp:VZ:kZ:Ud:62:br:wK:M5:gn:oI:0Y:jJ:A1:lK:Ej:Wl:sQ:26:kQ:dA:gT:c5:QG:Mt:W9:ZK:eh:vn:9g:NW:Tz:B1:lT:ie:r9:2M:Re:1K:pq:1k:JM:iN:CK:Zr:DE:On:Wv:cd:NC:8D:WM:qh:TP:Zn:Dy:xw:hY:yQ:0h:Lg:Hr:rD:3k:eL:fH:ez:Dh:Np:1h:yW:rQ:9J:l6:2v:RK:Yp:oP:yn:g8:jv:Vb:cK:xn:jW:W2:Eg:3P:Uw:St:Nx:3O:me:LV:Q4:ph:Ra:Bi:ny:8p:GH:BW:8p:Vf:GV:EF:n4:Qu:VC:pn:hx:99:OW:jF:FE:bw:im:2e:Wt:6b:Rf:yS:6q:Lh:Wx:S6:MJ:IJ:mb:S4:sr:DN:fr:LI:OM:IM:x6:zM:tl:sy:72:Fg:no:9s:Bm:NU:VA:7p:Vh:4r:7r:zQ:q1:ZF:lE:KC:6k:NO:hR:1B:Nt:Z7:e7:G1:KQ:jJ:2h:cf:wm:mq:di:mF:ND:rq:ar:fZ:49:T5:Z6:oq:rG:EE:wh:TN:Zj:L1:kn:XP:Eo:96:wZ:KA:PO:s0:Uk:Qi:u8:MG:r8:T9:qh:X7:RF:UY:ng:jm:vM:0O:uz:rX:Co:cs:Yf:XP:H7:Ix:Yl:Kj:AP:qy:t0:Jd:Yc:QE:QF:dO:xH:5T:fB:Cj:9Q:Qk:ve:Km:1n:I0:pj:Be:S2:oJ:JD:te:aA:Ap:wL:h2:UI:AI:fp:q6:yH:QH:tZ:TV:E7:ww:fr:Ew:ms:Sa:FK:s3:z3:tD:Gz:Tg:MD:Ws:sY:gE:Sg:B0:9U:cp:d4:Dx:Ag:P2:82:TN:Mk:dv:KD:jt:v4:Oj:dT:A7:My:sr:j3:tq:8C:Jt:Vl:GE:rl:7P:oU:0q:8M:8X:vA:ep:Fm:pc:Rq:a7:Q0:M9:MC:Sq:ce:cR:6v:HL:Ni:kX:mH:Yr:85:wg:w4:vV:kz:MV:LM:TH:9j:ip:Id:wv:3L:ke:Dq:ys:rt:ud:Oi:47:A0:5q:Bo:lk:eI:dR:Ea:dR:nw:SS:T2:s0:v8:K7:RH:NB:9Z:44:Sg:yz:nv:2Q:U4:fL:eO:a5:pZ:ta:mq:gv:GY:BP:w3:5U:YN:MQ:OG:No:H4:xK:kB:Ef:b8:I6:BQ:5v:XK:v0:P8:Bz:4q:OF:4J:yt:ou:sp:3G:HB:XH:46:Fy:k1:zY:Cu:Oz:Te:QY:rp:G4:Ad:F9:Gq:bN:CT:1i:Tw:2s:eV:BM:w3:Nd:GA:uM:jJ:Ck:EG:kQ:pe:Ms:rO:3g:Da:og:43:TO:5L:6G:VQ:IJ:Jc:Jm:ym:Vu:Fn:AQ:2q:NH:4b:69:tH:qH:aQ:bq:Uj:T1:x9:TR:yr:73:Ij:jr:Wh:0S:gb:Gj:lA:cn:GQ:4r:ml:xE:jl:ZD:9r:M0:SR:Ue:hI:mJ:bJ:zo:7h:e5:P6:Xs:ES:gM:5B:Tj:CV:oA:Il:wj:n9:az:lT:Hj:V6:PF:MI:Nt:px:vs:14:Ub:oA:y3:4k:p0:Ls:39:wU:hp:0y:DS:zS:va:Om:qm:qo:F2:3t:By:tD:JM:pC:8g:XM:xl:HK:9J:Dn:Q9:7u:UW:EI:zH:s7:oU:ih:yt:XP:XF:oV:Ac:oY:id:gG:XV:hQ:tM:se:dT:Og:Vq:4u:8y:vQ:ix:DJ:9Q:TL:lf:yH:RW:Pm:bD:hf:so:yX:pz:Op:Uw:IT:Rp:nZ:bF:ud:hP:W7:fr:Sx:Zk:tt:vJ:S5:EY:jH:in:UP:NZ:tj:lZ:oz:xk:um:9T:Ut:yh:8D:wP:zb:kl:vS:Ij:GR:1U:NY:3Q:43:Oi:GF:uK:6u:Hg:u1:gX:Xr:MX:Jo:Y1:xa:Kg:aI:5j:x5:6t:5p:zH:Y4:Ro:zt:tt:rg:Fx:6Q:xB:pe:vS:jn:TS:b1:74:OI:li:Mi:Qt:xY:Jq:1u:5T:2S:SF:c7:Kk:tP:tC:mC:iR:HA:I2:Gg:cF:Qc:DV:Uh:qT:m1:UA:mR:Ni:B7:hE:Ap:Gt:H3:Om:VG:da:qj:d9:tS:co:Vp:Z4:SM:Jj:ab:s8:5Q:XQ:69:oi:rP:Dr:DN:P3:zR:R1:8h:yR:we:1U:ao:60:lk:f4:JB:Hg:DU:wJ:HP:zF:Wh:U0:nb:1K:8I:pA:4N:lp:23:Oc:No:ll:L8:iW:eW:tO:db:ea:oI:8b:pa:NM:xh:jg:NM:N3:by:eL:pg:rt:wL:Jx:pB:ad:rE:Bb:11:hN:Xx:OG:ty:ND:7L:jb:sw:5F:jy:6A:25:XO:1U:mr:pz:tG:49:vg:Cs:L0:gv:dr:3N:L9:lx:RE:Sf:9G:JV:Wz:wm:is:zL:vS:Jr:V4:2z:Ro:O2:eS:DP:ai:XT:lP:Wf:93:g6:3G:sd:4e:or:Hb:R4:Sp:Gy:AV:Le:VM:ad:eY:d9:GD:hb:WT:Fu:Jt:XB:Hy:ao:ys:jJ:eR:fV:ho:sY:8c:RJ:OF:fO:Jm:V1:Vn:Hj:L1:lC:MH:Xp:KY:TH:lQ:9x:C6:w6:PK:zE:od:0x:Iv:sw:3C:D7:Cr:nc:FB:96:h6:e3:E7:Vn:oT:QH:fl:jJ:w0:lW:Bq:BA:I9:b4:PC:Eg:MF:wt:QP:lu:Ya:Yh:pt:vc:bo:Ja:09:9F:vw:mg:g4:fW:0E:b4:op:or:rT:6V:mW:fx:mA:d9:IL:0B:yB:H4:4b:Xh:g0:rt:0m:Gj:oo:yL:3t:5t:0C:PR:NJ:y8:qe:0M:Yz:4N:s8:hv:Mj:97:Or:w2:tm:7z:GE:GX:ey:5R:Qy:JG:Zs:Oi:DL:qX:po:pD:jR:3w:ZT:Ij:le:l0:wz:Qs:xd:Hu:ua:3I:9o:YR:Ky:Ic:Tt:TZ:Ek:r8:LH:oX:Uw:Ft:ql:vK:kT:82:Fr:g2:6U:wT:Kz:K6:pc:HB:XU:h5:5s:GC:E7:5p:EB:TQ:7t:V8:Ya:vR:ar:Gf:Am:dm:Wv:YO:oY:eI:qB:K3:LJ:MN:Iz:O7:38:8c:C4:Ka:NN:dz:qx:g0:kQ:gL:cl:c7:lt:Rv:IR:0O:RE:CR:xg:oU:yj:HL:wt:JC:my:xC:Bb:Wi:pe:Md:Zx:WZ:7U:n2:38:Nb:j5:65:fW:cL:kz:TS:CI:r4:W6:Nu:FD:Nd:ok:E7:bN:TS:CI:1f:Zv:R2:NS:em:jG:MS:Nc:iS:Xf:Eu:B8:Fg:Qe:fD:xq:rI:hn:0Q:mT:6i:Pz:fl:bI:dh:2V:CO:2a:ro:oE:c1:BH:ML:s0:rr:XN:mn:jV:s8:9q:oM:sg:Hw:hZ:bk:JV:Yt:nN:pa:Jp:tx:46:52:EW:9s:to:c6:JT:mw:73:gE:6Y:xo:2u:0z:Cl:TA:hj:rM:2K:tJ:gY:zY:Hw:AP:z4:b5:aC:5G:mq:U1:wY:Uq:qf:Bk:l4:qo:Qn:If:xy:Z3:0s:YY:CV:db:90:97:sf:BS:XN:jC:FE:xw:cp:mx:Yo:JQ:8X:ZY:VH:T8:4p:pt:tu:Wx:Wm:Sf:HF:s8:Nq:Ck:v9:J0:Gt:bz:OE:QT:EL:kh:TN:ky:M5:Gx:yP:Fo:G1:vy:XA:Z8:cF:yf:oS:Yi:mq:2T:RJ:K9:SV:7j:sQ:0J:D7:6I:SN:YO:hS:Y0:D9:bj:74:j5:4e:03:XD:Y6:G6:rf:X6:dQ:PM:Lm:5c:Eb:XK:Ey:sv:TU:Ly:Qg:Wn:GX:Jy:vd:xQ:d6:kF:ln:G2:qp:pa:4A:yi:PP:11:T2:QN:Wb:fA:lU:1Q:NP:8b:K4:1B:ZQ:EX:1S:Ui:4P:EG:cH:Hi:Vm:ep:cD:Zl:v7:dl:WL:cX:YD:Ey:3T:iT:2a:5s:NK:ej:dk:Ri:BA:B8:BR:1z:3o:sC:SS:xo:F2:NO:Ed:pL:B1:pC:PW:lO:3a:7S:cx:IP:NK:eF:21:Fk:Gq:g6:9l:mP:p3:Qd:TP:d2:CU:Pk:BN:lJ:oZ:as:Jf:l0:47:r3:fE:IE:Xb:iL:FR:UH:o8:Z4:f9:fR:26: | RafanSTR | RmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpnRmblvpn $ | RMBL" > "$shctmp"; then  umask $umask
  chmod 700 "$shctmp"
  (sleep 5; rm -fr "$shctmpdir") 2>/dev/null &
  "$shctmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n%s\n' "Cannot decompress ${0##*/}" "Report bugs to <rmbl@rmblv.my.id>."
  (exit 127); res=127
fi; exit $res
�
�l����3D�DTs�KT�c�r�LǸ
�]�6�n�|7d"���5\�KJx�Ι�Qs����nJk�#ːAdT���o�\���4�N{�ݢ����b��X�,=�h�NJ���X�exHO׼�b��Z�U���)��>);��ۣ-���bJ�n�T��/��$���0�ȬZkQ�#}��u[�ƾ���K��ľb_�y��?b�����Q�{��`�D����p�?ޞ1d1p�9��]���o�l��XF�����o��=��MJF;Y�$����	݁��� �:��6�/����0K��w#+�����Gpm�ְ*�{�ۻKNV3G�D4�A\t=sQ��+����m �|oD.p�j�"B�=�F`�0SA��#�r��i��]��?|a3jpJ��q5ڏ����!���$l��yjY|wQ=?�h�>ǖ��Y�����F=�tC�w��"��+�:�*��.�?�Gw�I��˽o��M�}��r�x�G�Gxy���N&���Z�Wb�Yx��l�9��y�&�����t����8ʷ��
#W�T���P,�Y^mđ8�,	��d�8��`����e:�����Z�����!&\��&rE��c�
�`�kZ~c;�z��t�=k�*#��i\��ԣޙ넦�3�X�����%����f�B�[����k���j!�y�E��Qs�Fi���K�`#�+�eN�W��C��G��2p_zM��C���wЦ�"3�(-�0�^Ej�V����`b\2Qȍ^�(�P�)&�Z=�JY��+�X�G��a��ɫ�K��%39�9�
=իU��z��IU�]:F������d]�W񮘘��6E $��qv��3�׾bw��z|���o���	�#�B�Ȁ;MbY��H|�X>��$����g1wk����hy�����F�Aczh&��W���x�4~d��_����2���<,1���X�M�ګ�/:��P��c)��>X�m�.a'��HJ#�R�{�����sÍ��x�������b��m?=�&�Ȣ\�d���sx9�yv�ր,��RG���$=�H�ˑҕ�ר��la%���N��^z�0l2m�U�>�J�y*��������j���V�p9;&Q�&�%B�QB��ˤq'����'z�Y���RKrа�j1>5W�]�	��� ����î#0��z�F_3����e��+�WBP�����%y�6����90���?$6���`r1!�.���"T��<�c����O�ԅ ���:�lE8��)x�H�8,�d�K���l���@[�f�M�|��\Q����d�ؔ<�B�����6��}�N������&p���$
~����G�
|�`������{��_g:l��Kj`�P&�>}EX�)��y`�啥&9?�D�
=g[EY�7���V3$tbL��+��!A��Ͽ�q��)��3�����o}�� ճ8k�f>j@�*�G�:[���d���)��y�9
.�j���{��tk�?���2J�~0����~X�3%��;]��$x�'��@c��X���)D��(�t0[���fڄ\��
�����Ĭb�|1�j7���赈�b�c��*f�}�ȹ�c�֟��t�f�$�K\��l�7D�s�f�.q
cjɈ���ޜI����zıNմ�^3o��� ���.ILt�N��pʩ��[ޙG�X�^�|=w�a��ʇN�*6D�B��e%h��S玷o�X�h�{�V�`��8fw3	��@��Z�����X�W�O3BE�#�y[&*劉{lO�w���zbg�A+s3��(��0f�B�F��YX$�h�^�*=]�����[���\��s�!��R��n�����ʧ<�.�[9����#ݰ1_+:Klq����C=�	ɷ�n�.l��^ȇ~�EF�iP�R�  �JD���A�.Õ�;�"]� 9�LR�@�N3�B<�k�P8�yt���
C<=���qpP�hyj+B�U�^��=��m�˅�j�KkG�u�� ��zܝ�ȃ��6T� �\{�
dd��
3ߑq��]J_�d[$�>���|�6���K��at��l�Fd����5 �k�1��\�^SU��C����K�
dR	:218H����4�*l�Z�Y
@=���i��쪤�{�G�"i/�j�J!��7F���ɘ��U���D�G,���ogg����DPo�?���2+��%��J~}Y`��}�7��]*4C �]#2��Q5l�����ɳ�v.���i[~a���C9mn7��5
f������f4�m+��;�!�6�@�  ��m����R��k�RZ��e�`y��R������CQc�r"�41�Q徕~�i\�#S�v�jq��7�3���:��U��a��ë�`�b�,�&^o��O�fB�A��m���Цx�"�>��OM���<ؤ@��/?���	b�LN�WP�0$�V������G
77�|lZ��h�x�Z����t��Y09�,>�>�B��ǅ���0��;P�qU�T�Ho!��^?��󹛘;��٬wR ��1#2���&�o�2/@�h}��QV��>�����W���%]7E��,"�Jӱ��פ��|ԒI&�^)#�W�9M�ըGP8a�ч���5��v��������{��eF
�ν�>z����	$2����I����gf��ab�`�f[�3��aε2�@��T?�����o��̐�S��Fz"�s�G��M`��!{j�"Jb���Z�0����I����s��d�ݡű���S�����q^|�
�P>v�f7(�N�����(�^�m��t!C�H`W���у�f>�!tNH ��3��%�{��.���N&lc�O�����dU-��ޡ�����.&RVZ����:�]Mm��CA!�ᯇcQ�y�0ko��>O5fh��m=ጐ�^����%BW����41�@���Ɖ���b�qα]5$��ܒޫ�T^P�ӈ@殦(ĻG��2<߯�!��BF���0y���Uʔ�U�e�/x����h"°l4�,�GB��޻ �@�RO���$����.�5D2������w�s!y"�WU�T��l>ݪ ��G��9�~ҹ�ZZ?���
�A�ʞ����LU{�Y1���b���Q;=����D�28����5ց!'Y�6�b{�s<�����~-R�skx�Sm�(���:�>�ￕ�ClS�kt�!����V��ɿI
���A<��D��]���e�0V*�+���)��k��/��\�hx�N�Ye]� '�����3�����͇��Y��p5rct^~�r�GgN�2_�
�!|�z���B��|��! ���)���I\z`�ɽq��tx�H�O��񠨍cY�ĭ���XgcE\c�F_N#����@�vΘ_���m]���	�p���&��U�ȼ���ܘ���..���P_tJN{�Kv&k&r:��
7��I���SZ�坘�p�M	`98/Iî���?�CSt��/��ݠ�\r��ٮ=c�x@��K���m!��ͭ�����"��4n?���9�@pI�z��)ׯBؘp]R8��� Vu&�"��l6���f�O�|��W4O�P�'[�=��ߤ/%
�:�:���;}����Q~����e犍!�:+4�V �z*,���m�=L�%��Q���#���M�ݣ��Ղ�����l�?�%�z���-��D�	�wl�����?:uMd�u���ちLSy���&�;��Q�d�0��^9�wMå�o��Ǟ��^���05$R(5rh�~��G������w���E�Y�M*�r&�yՇ�}(��NA:��tB:8ʚ��f��n�!����,���lߵRw�z@��-2�G�!L�˕�I?�����V���v�A�4Ɉۀ�Uc�<�XZe��Y1F"�\�JH�
����c,���� ��?G5%�q���K�Ȑ~|ʜ�UKaA�t�f����nD�s�(�=(Bh&�W�tW:3���b�� z	���b�?vj�BR}��~�`_��%�Y���z��u��hKR�๕<cL��#�l���q�S$�<�8!g;/@�;�#S�jzmjٛ����M۾�۴	�[�NRSg9,`��nM�����cQ�,����,c�n��z^���ߓ��e�y�Ĉ��g@*.�j��d ����1d��%dV�]���P����C)X���YC/�5)��p|m��='��������P�eڨ��z��-j��p9˓�Ũ��E�*�W!���iY�@P�b�C��P؎^|�Pe��ޅ)��>{��jW\F������hrs�GsT.+Où�1��> +�$3�j~&%${C??
���4�֨����XIf��HTqD�"�󟛓0z���_�*��D$��ƫdMD3�=��~�$XQq ���~��Z���d�Z���2y�k��,ˆ��<��IM��T$��z�:ل��G�*�r�3c��o=�*�0K��j[�һLa�����oE<�N�z�ަIٓ���߈����]cf�N��N����bjFTq��Z"��f�߰B�NE���#Ƀe�L~�x��{��-�	YjC�Mu����;,�i]�W�2��X�0��QFk3Ur���a��l"�B��Dl?�L͸��p8v���7�B;3�E��T_׍_�vC�/��N-��g�V|�'�
���c*����L�u�8��f��E�.�}�v�M�"i��>�G5��Q+�G,J��MO�鶽e�S��o�����:��G直�F�c��� �k�Ҏ�b���/5���� Z�yoƣC���W2��������l�Isj���VO��X�'�l:�$2?}�
jtHt���X��,yL���g�;Xf�X�e��B<�-�}�_�����58]?�4��U��W@�?Ĥ4�(\d�w��An��9"8Ś]-��`���*K�$T�"����t��,��G��8qXd-'��~� /tz
�6T>rp���,YC[��͚Ǆpiݰ�b�����O.P�&}ۭ,l]�t���!0�� �k}�����~�M��_�#�b��΋TX�iK$�s�|�}�	�ŀo��DZ�}/�9[�gB����s���pJ{)����_�
>y��t��-0Z����Y�Dx�Q�o���/�::)q�r+pDʮ ��nF�a'�m��w�)W���DL�5�Q&��غĚ��¤��l��A_K���c��f-����NV������_k9-�
�D�0v�j7˼]����Or�$��H����^D'�v�ؤ�d0�v�~ILTn	b'(�����fFG��e��:Q�7I �[fI����DN�d���=� n����8�m{��ɯh� �e�t�(��E�Sr��o�W�h�0 ��ݹU��[2o�"w���+���~�N���	|�n��L���s�'@줳
Hp%Ϋfټ�i�h�R�$��=.�?{�*c|�FT]xf_�����ut4 nB)b�*˪~�O����)�Q��J����+�!G�g�{�"�0��"EE��o'������|l��f��1?��Ӏ��v �
r�d���Uƍff��3%	�!�s%���зnӐ`*
�������B	}H��"4�P$/�X��D��*�*�2�Q�A/Q��]Ț�6��z��Bftp�0��9�3�� �4�6! �
�$��~'�e�_��M�N�b������^���-�T�,B�
��UzB)&Wp$�!i�����L�S�I�t:�i���{.�k%B�
5� ��q(I��5	��{z� �9�l�M�j]`,�oVP��FЖz-�p�{׽WϘ�^1�(�ȱ�#��j���ҙ����w�������+�{^z�m���V�`������:��������,����w��^#���tC<���_盽��խ7V�����
n�=\�jU:�D!p,Fɔ��F#EjSC�����g
$!lԥ.kU�"B=q!��9���� �M8,J`��~h_�s�ݪ��y��:a�^��OW�tki����mC޸�0O��j;
l	YP�V1Ś�6����e|�u>+�W��8�5��O�4�D������t���dI`h��?�1%m�^採\6J�@rד8WX��!� R�(��j�N��i�g�`����͉~�p&$���ϖ�Ba��Ka'&aq˦� �7.��J��H�_���"�b���&��$���ArN�P�ݖ��Z@��T�c�
W�~+�|��d�c���1��%�������{� ӟk.KdL������'�� 1�܀!Q�"܎N�ԟ�
5���b�¡&�VY��!+�.�4�tؗ�OG%n���7�^�fp:VKu������T�o��qǘ�E���ۻ�F�UL!/�.�(�f�n�*EQ�F+�����z��y�%�r��8�|�4�
nk�v9H��D^�}�(�;L*��)�m�l��ͪR/-și��
�r��OqC�� _G�}���Y6{ة��Ύ ���g�V�������),��.� �]���.�)XR�d����D<jv���r�%|�M��<���W�kwC�!�pTсո4�	�����y��%1���bV��[�<���6n+�_�X�����������} p�,����f��h^�W���$��S��Z
޴8���υ�~�y"Uj+h��r�ַ����f�m����Y��ʷk��J��"�dY�
�Sm ���r�e�ԡ��Tɣ�Ӕ��i8�Աx��Or�E�J��k*/���I%�c|hrQ"t�P��'%�S���̨������U����N׵_��;���?�>u��\P=�MM�'�����~1h�QӒ`�I�I���_{|:B��4e��0�F
�N���`8m��0��Q���2p�g�Tڂk5ez�>x��@c�OJ2�����ﰸg�^��
���耻����t�s,�凞��!����OK��ka����� G��c�N�E���ؿbE���51܇���?�MF�8c�,�h�NHH�g`�=$�����&�%�|-Ĥ�T<��c�WWp�sU�\:X�*��k�L��#���3��'KS-#84	�`�
Q�:U���WNC�ʘ��|�
B9�����{�{7
Ϫ^�9gt֚CU~"9,ǥoVt*]�(<����@�};8�ȡ�=���G�n-a
r
s9h���}�x���
�an�>��+���䃵��q�`�­��ks�w<8v�g�+��Z-V��mrҪ�BP��.��Vĺ�Rsc1�5aȦ��N��ԃ>�3x�S���m[�90��f�`�m��L��+:�W�g$LEaB�kK��B0"�e�i2vQD.<�z�w�g<uN>�R�����;g@�"*x�^��Yi�䮦�qH�Q�Y�E;G��J�� �w��7�`�j�o������*=��nJ�S��1vT��k���x
�Z���oNO��ޥα��F?���'&�eU�~�Y4��F��1&&�r��p}nVM��s��A�G�('Q�+BĄ(����J���}�;��<|����ô�d��L�治��N��1�����1*��r��wjİa��Ԙ��kO"�
�I�L�Q�Lq�.���]a���VX�NL��2=�/�[�ߜI1���1s鄷�a��oJW���'�*�Y�8~P�0 7;$���J
���}xW�w�Ցa묮:�6'�҉$J��֎����h����P����c�^Y�q�t|�����L�	/f���tpM�G��q�N1�1��h���ϮCJ@�+`�b�V������fR���\7	a>�|�i�3�.�֐�etY�AJ0����#Ȇ����3ױ��4��g�ǂ79I��P���;r�Aܞ�_������H�3W"���t&=��B�?�ӜA��%>4�z�n��B<C�4�\Ĳ�9ݞ�2	��z�qnN��"eݏ�
��	�@�X�Q;IT��@i�/��M�b�6�n����Y��@�O����sK�!���y͜ҹ������i�i�0���i�\ B��c��L���(B�+�dl��ΰ6����`�A12@;��*�Gv���I�<��`�M�E��Z߆@�6�֊�3��y��~ݦ]�${�������~Z��1�:Q_)��kz%�����.���X�FX��d���4mV��
Q��?�1�)�8S6.�n�R��7��u�`���h�zb�Z�� �$���v��OMU�l�a=�O�j�DH���ո�y�F˙e3<ۓ�]r/�(<d/dH#���Tޜ�ً�o�~��X��B�l\�w��Q�2~�ǎ����$�q���� �.p,��h� ��,��W�|*Et%��X۴vx���&\�ᵠ��D0T���Q��Կͪl��y1�>���?��6u��Ə�sܟ,���:s�楳 "%�(f�}���g�IS�$���?�������;J�#�_���h�a�7	S�>:-���j��Qԉ��f��,�)m^gds�rkq� 1��2^�i�18!e`�ئ`	�#�/�HCЮ��#�MO��]8�9U��ߘv���U�R�X�2Pp��O& ��Q�y�u'o	Uh�ZVΑ���D�*�=}��[�Fn*��S���{�gd��������ڣ�S�D��^p7"@_V)�;�
H�.���`$:"=}�bN�lӯ"k
+�ƞ(3H!���w��22 #�u���kEK��L6�8���M<��q��r?��xȮH��$��f�ߩ����Z�������m�C�V���0�vߺ����f�Y�}�@%��T��:�#�Re����wҳW�N�Ѩ�$��X���]� ��j�JF��k�v��R�S�w�ѱ�B���u�r$r���\��l�<���pO5��Y�U��qV�F/�=����
9�u��J����(:XC�u��ǅ�����+E�M�()#l(6��m�?�8;v�$���Y�ůX�zn��"�����w�V�����l��K�?���%n<>�x��h�K�L�waε�qkm{_����`>�����#�b�fn� ��6�ip8d��wǈn{&ge�%T���RR��8��6:ݻ]J 70�@3�qC/ƅ�'s@2�
8�dI���ߜ�y{��U8�/�KEG�@$gò�����]����;t%f�՚��&-t�u�4�R��t�it�DY��B#m�O�=�%�d�PQ&����in3'�,6��s_�z�8C��Y�J�ʗ�j�~����-�{@9�qS$*�����M-%D=�=/�p^D<�ѴqhQ�겱-�A��-�
v��a/t��ܜ{3���[lM�α|�1cr�)-9p��~���9utq�(��ʏBB�R�|<+k����Iy5��r��(�3\˹E�*��*�Q�WQ�)ՀP�g�bDu�d2g�o���Է��Ϣ�[�i_3!�h�L�0�$V~ �m؄|�y�����C��dF�U�;"�11)bk�1�lJ�n�8����&`v(���8�h������RK�a�E�_a�q#l�#,��F�\�Dȝ���)x�v߷��צ�H�0�&*e�d��zɚ^-5��@��&J��
�Af̔P⃹a��-��>�u=�}6��1^*J�>�.�Eu2�kWY�4?Yy�ʹ�S����Bf�'�{
�
��g�10~�S�����ߌ:��gL�N %�����Q��$�j�۩o�����2�
NJ��͖"��Y`� ,J`�CVmǡ�}���1ӂe��.B[(n�a-��S�XLԊ��,�^|.� ��=V�`�G0���Ч�QJ��Ӵ"�O`�U���w(?�b�e	�0��?�������.��]���'�w����~����!42W�}�Uc�q~_�g�cSN
�e������=�x��9�>2`��`S��ͬʅ���~L`�飴_�N���o^��g�0&��f�.�i��n�ٱ,$�l0�4Y�D���u�?��x�]�<�&LD¿�#Gt����O��&�՟�ّ������x,66���Y�G��q 0�	��cH�����'�.�����p�V��K�@����9���$k�g��:9�λvk�)��u��2��:ٚ�KX�w[�˲9�U�3�q�_r�z��d������u���w��(Hr����\�N:g�&����o�P> O0?Q��A���
{Ei�ɵ�G�[�H���M��T�~w��{�1�~�%ֽ���ă��ǟ�|j��.x��vv�ތD���D��6n�"4����A������M粥�;�(~�%�vjK���]ty-XB"M���f���g��-B��Y�5�;�ޯ9�%���o��v' bka8�S�����=!H�BDlK|�i�K}X
Wt2t�A��2�-� ��*��޻P �#�785 ���T)���;?V|Gsx���]�r�$��b�yZ���*Еbr��-�m�YN��}6�1�ƠX�����(����{���ؤ[�~Jf)OVٍ�K���%����d�@�.����1��O��M I�hY���\\�^h/��9��Z囔�v8Rf��ˊ�[�\,������V5 c/{|#��t�G�@8���tP.4���Mjj0��GM�
�^�q�K�2�u��3��' $�*mݻD7ǵ��@W��"��߇�@�d�Ֆ��qcL̩�[\9�Y'L6��h���*_K�(�۬'��+��J�A8Sd�4��NW���c��nkd�a��N����Zaύ��1�v"��~aX�@�$�s.�� �vV��� "�A"5���͋<t�B�H�G�#�%������2�ӈ���A��*t��I5jl��Y��^
�d�!��!vI��!-���ڻ=$��%��h�MT�x|`�t��d ����U�_��K�fn>Q8{��K���l��7�y�y�f~�0Y���0^,°��a�����K�f�'��ٺh~����8{U�w���L�)PA�Y{�b�"�0����>�R	�� ��f��t#`����k+��);��Ɓ�	�k���U8FNx.���@7ذԉ����5!R\f������߼�e�Z��I&�s����J~}p�5L��Q�l�d�Vɚ�FN^���);S��ߕ��Q�ތw>x�zCe��)�v��&{�*)��6�޼z.g},2J��S%zkS������甀1���өX�Ai�����Z�@�th��`՜��Ȉ`�sh����~o¾��������tۤV��i	���$��`�pP����==����p�Y��$Q���w��������"�u�c��h�v�U���?���o_��Y�(��M�q�9��Db�d����� P��,=y�9.�,�}&�c~9�<�7u�L�����jL�d��.�c��冽{��ܢ�nM�W6�'1;�C˂��}��򊀓�*���G�X�ܧQ��	���׳�#��N��l�hc��C-�/T�T��M� v}[.3+mD���-�u�''8#/rG�=jG���xr>�Ѧp�=� ���({tؽC2|W-��Ac�1,�U���B���*�0P�n}@�{y�AtM#.��,BO�賂�@�+����v�|=Rљ�0�7��0~��1a�_w� �Q#�H$@�w��cs&Z�J�a�'\n`��Z$� ofe�dm�SeC�I����g�/>UC0n�y�"�:�j2 � �Th����̋A�P�誹v��Ϧ"����б��:��C5~�B;��Z,`M��&�;PӲTb���j�@:�:��Ӓ�y9��,���˿�혷�1�p�5@�v�;��Ҏ`���#a=&�����wS�~{��W��k�K�x*v�`��u�k�/�*�
�l;�V��j@-4�S���{t4�SH�lw��Q�
���켍>1���C�۸̆b���5��.��
���4:�u��^�{/J���!d�����s7��M�-#���^����������;Z�	�j��]ו6h�~����x�檇s�kP��V�����֞��iN�U�F� ��z]��ꦎ�A�6���x�������8D�v�|~z<" $�oO͸R�!V3���Q��?1�g���U�^!��a��V�Wv,M�N�_<�?k�N�_�"/�Pb�N���Wza�T����+�����`�[AQ�H1Y�9^�!�Ty���m(�u�v�����˩ ���@P
��7�S���� %�f�!J�Ihl7O�3�V�����c�re
�^#��a32�CI���nb]:H�~� nX
s5*~�j�H�Rs0(�K$�ྐ�9��/��VV2vR�
��m�8qt�)��^�?!���Cg�hl)_Փ	��zm̉h���DB�פ���D�4���
��)/	�2�h@��dH*k�<K�o����-�}�ꄡ<�]��f]FG�X%�G?��I��Ac��\�/j�Y��H��D��R%ɃF�򆘦r���H�A�
h����<h�\/���*B� D�l��\��+Rᡖ��oҗ������<B��K~��m�b��`0(��x3ӄ&?Ğ�r�!��~�v���V���'V�<�Z#�?�pyN���Q�i�u]I�0�9����n�r��������Q��^�-�j�53���]s̋�z��j�]�qٟ��k����r^G�h\L�G
�UMNv�
"���1�.s&D�������!n�QE,���̴��p}yǫ���O�z/
��=��,M�$��6�������Z�����,?>3��kFύץ�g�-����/B�>ڣ�/:_���u}[�4.���uB7��1b�#M&��=��u�m���τ_KM�q��,F�����Ծ��Tj:WǗﰾ���A�;�}���M
�g[!�XBjgԡ���ܔ����������2R"�)n����i��O��_&�a��0�p6��9�x0��N�ʗ��nN+��lbN���:[&x���Qk.���^�CB"s0tU�#@Ze
�M�CZ=��'�Frx�Ǵ��ę�5���䬿��;��͢��~m.xD��VHD5��S=
��6�r�����D��H���Ӥ�s,\�Ew���������>�TD9*�G��)pD�����<�=Q��ce���a(��
�l�[�{'\vM�c)���m��������E��S�6
�Q�c�*=���`�uo(Y��-�ۛ�%y��P�[��qX?�\ߥ�[���0�P�V�/*�����z̸Tk{����p�j
���+����B�7�1e��E���aT���5�����r�9]��������PG�O��,�k���4#�G�X,���{c��x;�:y��7{.��3J�̜����7��w³׍�w�\�
�A���sU�\	�6��Z�r� ��������Y�ː��<�Mq����{m�o�G��þ��6w�0_g�C�5����@�KV7�O5�>��,���'����&��]�XU�N�> /z�x7]�t,y�q���J�u܂6)�Lv�p+�"	�@A]�ۄZlc�(6F��~�P�@9h��`7S�hq�<	b���ʣ�(@�c	O0ȣ�K4��c����X�
�4:�	)�*))�'{W��6�£�G�O��Dy�I���!0O�t{�b�ތ�Fp�<�՟0@}r�j�@P���'C� �A�t
���d���R6���n�w<y�jx_Aja+.�s���Č���~��@}����M9��!
l��U�&���g�]po��x����)���)�����♹aâ1H@/�:��s�I��6��!#���_[H�n�O�)�SS,��}j�< [�"�o�l�A\H�uy�<��[U�!2 �܄7�T�S���؜��9�^h�������*��&�DpБ�0�7��j�;�C�;K^�9��B��x"'�?��c���8lA����$�6t���]�4,J�t�s�����[����,�Vs$A ̟����=�!���b���z�w	��w��^w�`>S#�.���3ix��3u��>U1���`�a�#ES�U�0���+HT�ؒڈ�4f=�
Y&�p,��[6�9!u�	�o