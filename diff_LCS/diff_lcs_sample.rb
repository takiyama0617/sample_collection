# frozen_string_literal: true

require 'diff/lcs'

# seq1 = %w[a b c e h j l m n p]
# seq2 = %w[b c d e f j k l m r s t]
seq1 = <<~'EOS'
  私も生涯同時にある意味目という点の中を貼りないです。
  もっと先刻が誤認式もけっしてその話なたまでに失ってしまいうには約束申し上げんないて、
  まだにはなっないませんだ。家に聞かまし事ももっとも前へもしないないまし。
EOS

seq2 = <<~'EOS'
  私も生涯同時にある意味めという点の中を張りないです。
  もっと先刻が、誤認識もけっしてその話なたまでに失ってしまいうには約束申し上げんないて、
  まだにはなっないませんだ。家に聴かまし事ももっとも前へもしないないまし。
EOS

# 2つの文字列の共通文字を抽出
lcs = Diff::LCS.LCS(seq1, seq2)
p lcs

puts '--------------------------------------'

# 差分検出(seq1が基準)
diffs = Diff::LCS.diff(seq1, seq2)
diffs.each do |diff|
  p diff
end

puts '--------------------------------------'

# 差分検出（seq1が基準 1文字ずつ）
sdiff = Diff::LCS.sdiff(seq1, seq2)
sdiff.each do |diff|
  p diff
end

# seq = Diff::LCS.traverse_sequences(seq1, seq2, callback_obj)
# bal = Diff::LCS.traverse_balanced(seq1, seq2, callback_obj)
seq2 == Diff::LCS.patch!(seq1, diffs)
seq1 == Diff::LCS.unpatch!(seq2, diffs)
seq2 == Diff::LCS.patch!(seq1, sdiff)
seq1 == Diff::LCS.unpatch!(seq2, sdiff)
