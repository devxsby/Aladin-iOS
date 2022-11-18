//
//  BookDetailVC.swift
//  Aladin-iOS
//
//  Created by 김인영 on 2022/11/16.
//

import UIKit
import SnapKit
import Then

class BookDetailVC: UIViewController {

    //MARK: - UI Components
    
    // 네비 뷰
    private let naviView = UIView()
    private let backBtn = UIButton().then {
        $0.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        $0.tintColor = .black
    }
    
    private let searchBtn = UIButton().then {
        $0.setImage(UIImage(named: "ic_search"), for: .normal)
    }
    
    private let basketBtn = UIButton().then {
        $0.setImage(UIImage(systemName: "cart"), for: .normal)
        $0.tintColor = .black
    }
    
    // 스크롤 뷰
    private lazy var contentScrollView = UIScrollView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
        $0.showsVerticalScrollIndicator = true
    }
    
    //MARK: -
    
    // 책 상세정보 뷰
    private let bookInfoContainerView = UIView()
    private let bookImage = UIImageView().then {
        $0.image = ImageLiterals.Images.detailBookSample
    }
    private let goldStickerImage = UIImageView().then {
        $0.image = ImageLiterals.Icons.goldSticker
    }
    private let bookBackImage = UIImageView().then {
        $0.image = ImageLiterals.Icons.bookBack
    }
    private let bookNextImage = UIImageView().then {
        $0.image = ImageLiterals.Icons.bookNext
    }
    private let bookName = UILabel().then{
        $0.text = "기소영의 친구들"
        $0.font = .systemFont(ofSize: 20, weight: .bold)
    }
    private let bookPrize = UILabel().then{
        $0.text = "제2회 사계절어린이문학상 대상 수상작"
        $0.font = .systemFont(ofSize: 14, weight: .medium)
    }
    private let bookWrite = UILabel().then{
        $0.text = "정은주(지은이) ㅣ 해랑(그림)"
        $0.textColor = UIColor.aladinGray4
        $0.font = .systemFont(ofSize: 12, weight: .medium)
    }
    private let bookRatingContainerView = UIView()
    private let bookRatingIcon = UIImageView().then {
        $0.image = ImageLiterals.Icons.star
    }
    private let bookRatingLabel = UILabel().then{
        $0.text = "4.6"
        $0.font = .systemFont(ofSize: 12, weight: .medium)
    }
    private let bookHeartIcon = UIImageView().then {
        $0.image = ImageLiterals.Icons.heart
    }
    private let bookHeartLabel = UILabel().then{
        $0.text = "3,785"
        $0.font = .systemFont(ofSize: 12, weight: .medium)
    }
    
    //MARK: -
    
    // 책 가격 및 배송정보 뷰
    private let bookPriceContainerView = UIView().then {
        $0.backgroundColor = UIColor.aladinGray1
    }
    private let originPrice = UILabel().then {
        $0.text = "12,000원"
        $0.textColor = UIColor.aladinGray4
        $0.font = .systemFont(ofSize: 12, weight: .regular)
    }
    private let discountPrice = UILabel().then {
        $0.text = "10,800원"
        $0.textColor = UIColor.aladinPink2
        $0.font = .systemFont(ofSize: 20, weight: .bold)
    }
    private let priceDivider = UIView().then {
        $0.backgroundColor = UIColor.aladinGray2
    }
    private let deliveryLabel = UILabel().then {
        $0.text = "배송료"
        $0.font = .systemFont(ofSize: 14, weight: .medium)
    }
    private let deliveryLine = UIView().then {
        $0.backgroundColor = UIColor.black
    }
    private let deliveryFee = UILabel().then {
        $0.text = "무료"
        $0.font = .systemFont(ofSize: 14, weight: .medium)
    }
    private let deliveryIcon = UIImageView().then {
        $0.image = ImageLiterals.Icons.carpet
    }
    private let carpetDeliveryLabel = UILabel().then {
        $0.text = "양탄자 배송"
        $0.font = .systemFont(ofSize: 12, weight: .medium)
    }
    private let deliveryInfoLabel = UILabel().then {
        $0.text = "내일(목) 새벽 7시 전 도착 보장"
        $0.textColor = UIColor.aladinBlue
        $0.font = .systemFont(ofSize: 12, weight: .regular)
    }
    private let deliveryDivider = UIView().then {
        $0.backgroundColor = UIColor.aladinGray2
    }
    private let eBookLabel = UILabel().then {
        $0.text = "전자책"
        $0.font = .systemFont(ofSize: 14, weight: .medium)
    }
    private let eBookDetailLabel = UILabel().then {
        $0.text = "eBook이 출간되면 알려드립니다."
        $0.textColor = UIColor.aladinGray4
        $0.font = .systemFont(ofSize: 12, weight: .regular)
    }
    private let eBookRequestBtn = UIButton().then {
        $0.setTitle("eBook 출간 알림 신청", for: .normal)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 12, weight: .medium)
    }
    
    private let priceContainerDivider = UIView().then {
        $0.backgroundColor = UIColor.aladinGray2
    }
    
    // MARK: -
    
    // 책 소개 뷰
    private let bookIntroContainerView = UIView()
    private let bookIntroLabel = UILabel().then {
        $0.text = "책소개"
        $0.font = .systemFont(ofSize: 20, weight: .regular)
        //$0.font = UIFont.font(.pretendardRegular, ofSize: 20)
    }
    private let bookIntroDetail = UILabel().then {
        $0.text = "제2회 사계절어린이문학상 대상 수상작. 한 어린이의 죽음으로 시작하는 이야기지만, 결코 어둡거나 무겁지 않다. 이야기를 이끄는 어린이들이 그 슬픔에 머물..."
        $0.numberOfLines = 3
        $0.font = .systemFont(ofSize: 14, weight: .regular)
    }
    private let bookIntroDivider = UIView().then {
        $0.backgroundColor = UIColor.aladinGray2
    }
    private let bookIntroDetailMore = UILabel().then {
        $0.text = "더보기"
        $0.textColor = UIColor.aladinGray3
        $0.font = .systemFont(ofSize: 12, weight: .regular)
    }
    private let bookIntroContainerDivier = UIView().then {
        $0.backgroundColor = UIColor.aladinGray2
    }
    
    //MARK: -
    
    // 책 목차 뷰
    private let bookIndexContainerView = UIView()
    private let bookIndexLabel = UILabel().then {
        $0.text = "목차"
        $0.font = .systemFont(ofSize: 20, weight: .regular)
        //$0.font = UIFont.font(.pretendardRegular, ofSize: 20)
    }
    private let bookIndexDetail = UILabel().then {
        $0.text = "1. 일요일 밤의 비보 _5 \n2. 빈자리 _22 \n3. 기소영 그룹의 재결합 _32"
        $0.numberOfLines = 3
        $0.font = .systemFont(ofSize: 14, weight: .regular)
    }
    private let bookIndexDivider = UIView().then {
        $0.backgroundColor = UIColor.aladinGray2
    }
    private let bookIndexDetailMore = UILabel().then {
        $0.text = "더보기"
        $0.textColor = UIColor.aladinGray3
        $0.font = .systemFont(ofSize: 12, weight: .regular)
    }
    private let bookIndexContainerDivier = UIView().then {
        $0.backgroundColor = UIColor.aladinGray2
    }
    
    // 책 줄거리 뷰
    private let bookStoryContainerView = UIView()
    
    // 책 한 줄 리뷰 뷰
    private let bookReviewContainerView = UIView()
    
    // 알라딘 정보 뷰
    private let aladinInfoContainerView = UIView()
    
    //MARK: -
    
    // 하단 탭바 뷰
    private let toolBarContainerView = UIView()
    private lazy var heartToolBtn = UIButton().then {
        $0.setImage(ImageLiterals.Icons.pinkHeartCircle, for: .normal)
    }
    private let toolDivider = UIView().then {
        $0.backgroundColor = UIColor.aladinGray3
    }
    private lazy var giftToolBtn = UIButton().then {
        $0.setImage(ImageLiterals.Icons.gift, for: .normal)
    }
    private lazy var basketToolBtn = UIButton().then {
        $0.setTitle("장바구니", for: .normal)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
    }
    private lazy var buyToolBtn = UIButton().then {
        $0.setTitle("구매하기", for: .normal)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
}

//MARK: - Extension

extension BookDetailVC {
    
    //MARK: - setLayout
    
    func setLayout() {
        
        //MARK: addSubViews
        view.addSubviews(naviView, contentScrollView, toolBarContainerView)
        naviView.addSubviews(backBtn, searchBtn, basketBtn)
        contentScrollView.addSubviews(
            bookInfoContainerView,
            bookPriceContainerView,
            bookIntroContainerView,
            bookIndexContainerView,
            bookStoryContainerView,
            bookReviewContainerView,
            aladinInfoContainerView
        )
        toolBarContainerView.addSubviews(heartToolBtn, toolDivider, giftToolBtn, basketToolBtn, buyToolBtn)
        bookInfoContainerView.addSubviews(
            bookImage,
            goldStickerImage,
            bookBackImage,
            bookNextImage,
            bookName,
            bookPrize,
            bookWrite,
            bookRatingContainerView
        )
        bookRatingContainerView.addSubviews(
            bookRatingIcon,
            bookRatingLabel,
            bookHeartIcon,
            bookHeartLabel
        )
        bookPriceContainerView.addSubviews(
            originPrice,
            discountPrice,
            priceDivider,
            deliveryLabel,
            deliveryLine,
            deliveryFee,
            deliveryIcon,
            carpetDeliveryLabel,
            deliveryInfoLabel,
            deliveryDivider,
            eBookLabel,
            eBookDetailLabel,
            eBookRequestBtn,
            priceContainerDivider
        )
        bookIntroContainerView.addSubviews(
            bookIntroLabel,
            bookIntroDetail,
            bookIntroDivider,
            bookIntroDetailMore,
            bookIntroContainerDivier
        )
        //MARK: - naviViewLayout
        
        // testColors
        bookInfoContainerView.backgroundColor = .white
        bookPriceContainerView.backgroundColor = UIColor.aladinGray1
        bookReviewContainerView.backgroundColor = .red
        toolBarContainerView.backgroundColor = .white
        
        // naviView 레이아웃
        naviView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(48)
        }
        
        backBtn.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.height.width.equalTo(24)
        }
        
        searchBtn.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(basketBtn.snp.leading).offset(-12)
            $0.height.width.equalTo(24)
        }
        
        basketBtn.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-12)
            $0.height.width.equalTo(24)
        }
        
        //MARK: - bookInfoLayout
        
        bookInfoContainerView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(423)
        }
        
        bookImage.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(15)
            $0.height.equalTo(274)
            $0.width.equalTo(176)
        }
        
        goldStickerImage.snp.makeConstraints{
            $0.top.equalTo(bookImage.snp.top)   //근데 시뮬레이터에서 top이 동일하지 않음..
            $0.leading.equalTo(bookImage.snp.trailing).offset(9)
            $0.height.equalTo(46)
        }
        
        bookBackImage.snp.makeConstraints{
            $0.centerY.equalTo(bookImage)
            $0.trailing.equalTo(bookImage.snp.leading).offset(-4)
            $0.width.height.equalTo(32)
        }
        
        bookNextImage.snp.makeConstraints{
            $0.centerY.equalTo(bookImage)
            $0.leading.equalTo(bookImage.snp.trailing).offset(4)
            $0.width.height.equalTo(32)
        }
        
        bookName.snp.makeConstraints{
            $0.top.equalTo(bookImage.snp.bottom).offset(14)
            $0.centerX.equalToSuperview()
        }
        
        bookPrize.snp.makeConstraints{
            $0.top.equalTo(bookName.snp.bottom).offset(4)
            $0.centerX.equalTo(bookName)
        }

        bookWrite.snp.makeConstraints{
            $0.top.equalTo(bookPrize.snp.bottom).offset(4)
            $0.centerX.equalTo(bookPrize)
        }
        bookRatingContainerView.snp.makeConstraints{
            $0.top.equalTo(bookWrite.snp.bottom).offset(21)
            $0.centerX.equalTo(bookWrite)
            $0.width.equalTo(104)
            $0.height.equalTo(16)
        }
        bookRatingIcon.snp.makeConstraints{
            $0.top.leading.equalToSuperview()
            $0.height.width.equalTo(16)
        }
        bookRatingLabel.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(bookRatingIcon.snp.trailing).offset(4)
        }
        bookHeartIcon.snp.makeConstraints{
            $0.leading.equalTo(bookRatingLabel.snp.trailing).offset(12)
            $0.height.width.equalTo(16)
        }
        bookHeartLabel.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
        //MARK: - toolBarLayout
        
        toolBarContainerView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(64)
        }
        heartToolBtn.snp.makeConstraints {
            $0.top.equalToSuperview().offset(18)
            $0.leading.equalToSuperview().inset(20)
            $0.height.width.equalTo(32)
        }
        toolDivider.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalTo(heartToolBtn.snp.trailing).offset(5)
            $0.width.equalTo(1)
            $0.height.equalTo(28)
        }
        giftToolBtn.snp.makeConstraints {
            $0.top.equalTo(heartToolBtn)
            $0.leading.equalTo(toolDivider.snp.trailing).offset(7)
            $0.width.height.equalTo(32)
        }
        basketToolBtn.snp.makeConstraints {
            $0.top.equalToSuperview().offset(14)
            $0.leading.equalTo(giftToolBtn.snp.trailing).offset(11)
            $0.width.equalTo(120)
            $0.height.equalTo(39)
        }
        buyToolBtn.snp.makeConstraints {
            $0.top.equalTo(basketToolBtn)
            $0.leading.equalTo(basketToolBtn.snp.trailing).offset(8)
            $0.width.equalTo(120)
            $0.height.equalTo(basketToolBtn)
        }
        
        //MARK: - scrollViewLayout
        contentScrollView.snp.makeConstraints {
            $0.top.equalTo(naviView.snp.bottom)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalTo(toolBarContainerView.snp.top)
        }
        
        //MARK: - containerViewLayout
        
        bookPriceContainerView.snp.makeConstraints{
            $0.top.equalTo(bookInfoContainerView.snp.bottom)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(219)
        }
        
        bookIntroContainerView.snp.makeConstraints {
            $0.top.equalTo(bookPriceContainerView.snp.bottom)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(182)
        }
        
        bookIndexContainerView.snp.makeConstraints {
            $0.top.equalTo(bookIntroContainerView.snp.bottom)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(188)
        }
        
        bookStoryContainerView.snp.makeConstraints {
            $0.top.equalTo(bookIndexContainerView.snp.bottom)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(227)
        }
        
        bookReviewContainerView.snp.makeConstraints {
            $0.top.equalTo(bookStoryContainerView.snp.bottom)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(593)
        }
        
        aladinInfoContainerView.snp.makeConstraints {
            $0.top.equalTo(bookReviewContainerView.snp.bottom)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(283)
            $0.bottom.equalToSuperview()
        }
        
        //MARK: - BookPriceLayout
        
        originPrice.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalToSuperview().offset(20)
        }
        discountPrice.snp.makeConstraints {
            $0.top.equalTo(originPrice.snp.bottom).offset(3)
            $0.leading.equalTo(originPrice)
        }
        priceDivider.snp.makeConstraints {
            $0.top.equalTo(discountPrice.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(11)
            $0.height.equalTo(1)
        }
        deliveryLabel.snp.makeConstraints {
            $0.top.equalTo(priceDivider.snp.bottom).offset(10)
            $0.leading.equalTo(originPrice)
        }
        deliveryLine.snp.makeConstraints {
            $0.top.equalTo(priceDivider.snp.bottom).offset(13)
            $0.leading.equalTo(deliveryLabel.snp.trailing).offset(10)
            $0.height.equalTo(11)
            $0.width.equalTo(1)
        }
        deliveryFee.snp.makeConstraints {
            $0.top.equalTo(deliveryLabel)
            $0.leading.equalTo(deliveryLine).offset(10)
        }
        deliveryIcon.snp.makeConstraints {
            $0.top.equalTo(deliveryLabel.snp.bottom).offset(3)
            $0.leading.equalToSuperview().offset(21)
            $0.height.width.equalTo(46)
        }
        carpetDeliveryLabel.snp.makeConstraints {
            $0.top.equalTo(deliveryLabel.snp.bottom).offset(8)
            $0.leading.equalTo(deliveryIcon.snp.trailing).offset(8)
        }
        deliveryInfoLabel.snp.makeConstraints {
            $0.top.equalTo(carpetDeliveryLabel.snp.bottom).offset(8)
            $0.leading.equalTo(deliveryIcon.snp.trailing)
        }
        deliveryDivider.snp.makeConstraints {
            $0.top.equalTo(deliveryInfoLabel.snp.bottom).offset(9)
            $0.leading.trailing.equalToSuperview().inset(11)
            $0.height.equalTo(1)
        }
        eBookLabel.snp.makeConstraints {
            $0.top.equalTo(deliveryDivider.snp.bottom).offset(10)
            $0.leading.equalTo(deliveryLabel)
        }
        eBookDetailLabel.snp.makeConstraints {
            $0.top.equalTo(eBookLabel.snp.bottom).offset(4)
            $0.leading.equalTo(eBookLabel)
        }
        eBookRequestBtn.snp.makeConstraints {
            $0.top.equalTo(deliveryDivider.snp.bottom).offset(25)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(26)
        }
        priceContainerDivider.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.height.equalTo(4)
            $0.trailing.leading.equalToSuperview()
        }
        
        //MARK: - bookIntroLayout
        
        bookIntroLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(32)
            $0.leading.equalTo(bookIntroDetail)
        }
        bookIntroDetail.snp.makeConstraints {
            $0.top.equalTo(bookIntroLabel.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview().inset(22.5)
        }
        bookIntroDivider.snp.makeConstraints {
            $0.top.equalTo(bookIntroDetail.snp.bottom).offset(15)
            $0.leading.trailing.equalToSuperview().inset(11)
            $0.height.equalTo(1)
        }
        bookIntroDetailMore.snp.makeConstraints {
            $0.top.equalTo(bookIntroDivider.snp.bottom).offset(15)
            $0.centerX.equalToSuperview()
        }
        bookIntroContainerDivier.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.height.equalTo(4)
            $0.trailing.leading.equalToSuperview()
        }
        
        //MARK: - bookIndexLayout
        
        bookIndexLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(32)
            $0.leading.equalTo(bookIndexDetail)
        }
        bookIndexDetail.snp.makeConstraints {
            $0.top.equalTo(bookIndexLabel.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview().inset(22.5)
        }
        bookIndexDivider.snp.makeConstraints {
            $0.top.equalTo(bookIndexDetail.snp.bottom).offset(15)
            $0.leading.trailing.equalToSuperview().inset(11)
            $0.height.equalTo(1)
        }
        bookIndexDetailMore.snp.makeConstraints {
            $0.top.equalTo(bookIndexDivider.snp.bottom).offset(18)
            $0.centerX.equalToSuperview()
        }
        bookIndexContainerDivier.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.height.equalTo(4)
            $0.trailing.leading.equalToSuperview()
        }
        
    }
}
