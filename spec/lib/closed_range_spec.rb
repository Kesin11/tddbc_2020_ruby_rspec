# - rangeクラス
#   - [x] 下端点、上端点を持つ
# - [x] 文字列表現を返す
#   - [x] 下端点 3, 上端点 8 の整数閉区間の文字列表記は "[3,8]"

# - [x] 上端点とか端点が一致する閉区間は作ることができる
#   - [ ] describeの記述
#   - [ ] テストの分類
# - [x] 上端点より下端点が大きい閉区間を作ることはできない
# - [x] 整数の閉区間は指定した整数を含むかどうかを判定する
#  - [x] 下端点 3, 上端点 8 の整数閉区間は4を含む
#  - [x] 下端点 3, 上端点 8 の整数閉区間は2を含まない
# - [ ] 別の閉区間と等価かどうかを判定できる
# - [ ] 完全に含まれるかどうかを判定できる
# - [ ] 小数を渡されるとエラーにする

describe ClosedRange do
  describe '定義に沿った閉区間' do
    describe '文字列表記を返す' do
      describe '下端点 != 上端点' do
        it '下端点 3, 上端点 8 の整数閉区間の文字列表記は "[3,8]"' do
          expect(ClosedRange.new(lower: 3, upper: 8).to_s).to eq "[3,8]"
        end
      end
      describe '下端点 == 上端点' do
        it '下端点 4, 上端点 4 の整数閉区間の文字列表記は "[4,4]"' do
          expect(ClosedRange.new(lower: 4, upper: 4).to_s).to eq "[4,4]"
        end
      end
    end

    describe '整数の閉区間に整数pは含まれるか' do
      describe '下端点 < p < 上端点' do
        it '下端点 3, 上端点 8 の整数閉区間は4を含む' do
          expect(ClosedRange.new(lower: 3, upper: 8).include?(4)).to eq true
        end
      end
      describe '' do
        it '下端点 3, 上端点 8 の整数閉区間は3を含む' do
          expect(ClosedRange.new(lower: 3, upper: 8).include?(3)).to eq true
        end
      end

      it '下端点 3, 上端点 8 の整数閉区間は8を含む' do
        expect(ClosedRange.new(lower: 3, upper: 8).include?(8)).to eq true
      end
      it '下端点 3, 上端点 8 の整数閉区間は2を含まない' do
        expect(ClosedRange.new(lower: 3, upper: 8).include?(2)).to eq false
      end
      it '下端点 3, 上端点 8 の整数閉区間は9を含まない' do
        expect(ClosedRange.new(lower: 3, upper: 8).include?(9)).to eq false
      end
    end
  end

  describe '定義に沿わない閉区間' do
    describe '上端点より下端点が大きい閉区間を作ることはできない' do
      it '下端点 4, 上端点 3の閉区間を作ることができない' do
        expect { ClosedRange.new(lower: 4, upper: 3) }.to raise_error ClosedRange::InvalidClosedRangeError
      end
    end
  end
end