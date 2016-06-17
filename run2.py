#!/usr/bin/env python
import analyse as a


def main():

    method_r = [ '_MF' ]
    method = [ 'M' ]
    a.build_contrib('E3_second_PWR', a.read_transaction('data/EG29_Case.3.', '', 'PWR_fabrication', 'E3_second_stored', method_r ), 0.001/0.9*0.3/1.5, method )
    a.build_contrib('J1_second', a.read_transaction('data/EG29_Case.3.', '', 'PWR_fabrication', 'J1_second_stored', method_r ), 0.001/0.9*0.3/1.5, method )
    a.build_contrib('J1_prime', a.read_transaction('data/eg29_case.3.', 'PWR_separation', '', 'J1_prime', method_r ), 0.001/0.9*0.3/1.5, method )
    
    a.build_contrib('E1_prime_FBR', a.read_transaction('data/EG29_Case.3.', 'FBR_driver_separation', '', 'E1_prime', method_r ), 0.001/0.36*0.7/1.5, method )
    a.build_contrib('E1_second_FBR', a.read_transaction('data/EG29_Case.3.', '', 'FBR_driver_fabrication', 'E1_second_stored', method_r ), 0.001/0.36*0.7/1.5, method )
    a.build_contrib('E2_prime_FBR', a.read_transaction('data/EG29_Case.3.', 'FBR_blanket_separation', '', 'E2_prime', method_r ), 0.001/0.36*0.7/1.5, method )
    a.build_contrib('E2_second_FBR', a.read_transaction('data/EG29_Case.3.', '', 'FBR_driver_fabrication', 'E2_second_stored', method_r ), 0.001/0.36*0.7/1.5, method )
    a.build_contrib('E3_prime_FBR', a.read_transaction('data/EG29_Case.3.', 'FBR_blanket_separation', '', 'E3_prime', method_r ), 0.001/0.36*0.7/1.5, method )
    a.build_contrib('E3_second_FBR', a.read_transaction('data/EG29_Case.3.', 'FBR_blanket_separation', '', 'E3_second', method_r ), 0.001/0.36*0.7/1.5, method )
    a.build_contrib('E4_FBR', a.read_transaction('data/EG29_Case.3.', '', 'FBR_blanket_fabrication', 'E4_stored', method_r ), 0.001/0.36*0.7/1.5, method )
    
    a.build_contrib('MOX_fuel', a.read_transaction('data/EG29_Case.3.', 'PWR_fabrication', '', 'PWR_MOX_new', method_r ), 0.001/0.9*0.3/1.5, method )
    
    a.build_contrib('LWR_OUT', a.read_transaction('data/EG29_Case.3.', '', 'PWR_cooling', 'PWR_MOX_spent', method_r ), 0.001/0.9*0.3/1.5, method )
    
main()
                                      
