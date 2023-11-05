// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.20;

import {Test, console2} from "forge-std/Test.sol";
import {MyERC721E,MyERC721A} from "../src/ERC721Compare.sol";


contract ERC721CompareTest is Test {
    MyERC721E public myERC721E;
    MyERC721A public myERC721A;
    address user1;
    address user2;

    function setUp() public {
        myERC721E = new MyERC721E();
        myERC721A = new MyERC721A();

        user1 = makeAddr('user1');
        user2 = makeAddr('user2');
        deal(user1, 10 ether);
        deal(user2, 10 ether);
    }

    function testCompare() public {
        vm.startPrank(user1);

        for(uint256 i = 0; i < 10; i++) {
            myERC721E.mint(user1, i);
            myERC721E.approve(user2, i);
            assertEq(myERC721E.getApproved(i),user2);
            myERC721E.safeTransferFrom(user1, user2, i);
        }
        myERC721E.setApprovalForAll(user2, true);
        assertTrue(myERC721E.isApprovedForAll(user1, user2));

        vm.stopPrank();

        //-----------------------------------------------------

        vm.startPrank(user1);

        myERC721A.mint(user1, 10);
        for(uint256 i = 0; i < 10; i++) {
            myERC721A.approve(user2, i);
            assertEq(myERC721A.getApproved(i),user2);
            myERC721A.safeTransferFrom(user1, user2, i);
        }
        
        myERC721A.setApprovalForAll(user2, true);
        assertTrue(myERC721A.isApprovedForAll(user1, user2));

        vm.stopPrank();
        
    }
}
