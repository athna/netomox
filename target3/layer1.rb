require_relative '../model_dsl/dsl'

# rubocop:disable Metrics/MethodLength, Metrics/BlockLength, Metrics/AbcSize
def make_target_layer1
  NWTopoDSL::Network.new 'target-L1' do
    node 'R1' do
      term_point 'Fa0'
      term_point 'Fa1'
      term_point 'Fa2'
      term_point 'Po1' do
        support 'target-L1', 'R1', 'Fa0'
        support 'target-L1', 'R1', 'Fa1'
      end
    end

    node 'R2' do
      term_point 'Fa0'
      term_point 'Fa1'
      term_point 'Fa2'
      term_point 'Po1' do
        support 'target-L1', 'R2', 'Fa0'
        support 'target-L1', 'R2', 'Fa1'
      end
    end

    node 'SW1' do
      (0..2).each { |n| term_point "Fa#{n}" }
    end

    node 'SW2' do
      (0..4).each { |n| term_point "Fa#{n}" }
    end

    node 'HYP1' do
      (0..1).each { |n| term_point "eth#{n}" }
    end

    node 'SV1' do
      term_point 'eth0'
    end

    node 'SV2' do
      term_point 'eth0'
    end

    bdlink 'R1', 'Fa0', 'R2', 'Fa0'
    bdlink 'R1', 'Fa1', 'R2', 'Fa1'
    bdlink 'R1', 'Po1', 'R2', 'Po1'
    bdlink 'R1', 'Fa2', 'SW1', 'Fa1'
    bdlink 'R2', 'Fa2', 'SW2', 'Fa1'
    bdlink 'SW1', 'Fa0', 'SW2', 'Fa0'
    bdlink 'SW1', 'Fa2', 'HYP1', 'eth0'
    bdlink 'SW2', 'Fa2', 'HYP1', 'eth1'
    bdlink 'SW2', 'Fa3', 'SV1', 'eth0'
    bdlink 'SW2', 'Fa4', 'SV2', 'eth0'
  end
end
# rubocop:enable Metrics/MethodLength, Metrics/BlockLength, Metrics/AbcSize
